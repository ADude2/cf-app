class ListrefreshesWorker
  include Sidekiq::Worker
  require 'open-uri'

  def index_url
    JSON.parse(open("https://map.crossfit.com/getAllAffiliates.php").read)
  end

  def get_gym_index
    hash = {}
    index_url.each do |gym_array|
      hash[gym_array[3]] = gym_array
    end
    hash
  end

  def perform(get_list)
    $redis_cache.setex("gymlist", 1.week.seconds, get_gym_index)
  end
end
