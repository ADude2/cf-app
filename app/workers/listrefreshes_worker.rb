class ListrefreshesWorker
  include Sidekiq::Worker
  require 'open-uri'
  require 'json'

  def index_url
    "https://map.crossfit.com/getAllAffiliates.php"
  end

  def get_endpoint(url)
    JSON.parse(open(url).read, symbolize_names: true)
  end

  # Sample gym array: [52.7481, 0.4087, "CrossFit 10815", "14658", "1"]
  def build_gym_index_hash(gym_array)
    {
      lat: gym_array[0],
      long: gym_array[1],
      name: gym_array[2],
      unique_id: gym_array[3]
    }
  end

  def get_gym_index
    get_endpoint(index_url).map do |gym_array|
      build_gym_index_hash(gym_array)
    end
  end

  def perform(get_list)
    get_gym_index
    $redis_cache.setex("gymlist", 1.week.seconds, get_gym_index)
  end
end