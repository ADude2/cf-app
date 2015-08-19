class ListrefreshesWorker
  include Sidekiq::Worker
  require 'open-uri'

  def fetch_remote_source
    remote_source_list = open("https://map.crossfit.com/getAllAffiliates.php").read
    $redis_cache.setex("remote_source_list", 1.week.seconds, remote_source_list)
  end

  def remote_source_cached?
    $redis_cache.exists("remote_source_list")
  end

  def build_master_list_hash
    remote_list = JSON.parse($redis_cache.get("remote_source_list"))
    remote_list.each_with_object({}) do |gym_info, master_list|
      master_list[gym_info[3]] = gym_info
    end
  end

  def perform(get_list)
    fetch_remote_source unless remote_source_cached?
    master_list_hash = build_master_list_hash
    $redis_cache.pipelined do
      master_list_hash.each do |gym_id, gym_data|
        $redis_cache.hset("master_list_hash", gym_id, (gym_data).to_json)
      end
    end
    $redis_cache.set("list", master_list_hash.keys)
  end
end
