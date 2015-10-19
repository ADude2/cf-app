class MassgymimportsWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false
  require 'open-uri'

  def get_affiliate_details(gym_id)
    JSON.parse(open("https://map.crossfit.com/getAffiliateInfo?aid=#{gym_id}").read, symbolize_names: true)
  end

  def build_gym_index_hash(index_array, affiliate_info)
    {
      unique_id: index_array[3],
      lat: index_array[0],
      long: index_array[1],
      name: affiliate_info.fetch(:name),
      website: affiliate_info.fetch(:website),
      address: affiliate_info.fetch(:address),
      city: affiliate_info.fetch(:city),
      state: affiliate_info.fetch(:state),
      zip: affiliate_info.fetch(:zip),
      country: affiliate_info.fetch(:country)
    }
  end

  def perform(import_all)
    master_list = $redis_cache.hgetall("master_list_hash")
    $redis_cache.pipelined do
      master_list.each do |gym_id, gym_data|
        affiliate_info =  get_affiliate_details(gym_id)
        index_array = JSON.parse(gym_data)
        attributes = build_gym_index_hash(index_array, affiliate_info)
        Gym.where(unique_id: attributes[:unique_id]).update_or_create!(attributes)
        sleep 5
      end
    end
  end
end