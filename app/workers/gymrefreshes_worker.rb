class GymrefreshesWorker
  include Sidekiq::Worker
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

  def perform(gym_id)
    master_list = JSON.parse($redis_cache.hget("master_list_hash", gym_id))
    affiliate_info = get_affiliate_details(gym_id)
    attributes = build_gym_index_hash(master_list, affiliate_info)
    # Gym.where(unique_id: attributes[:unique_id]).update_or_create(attributes)
  end
end

