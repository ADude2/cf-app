class ListrefreshesWorker
  include Sidekiq::Worker
  require 'open-uri'

  def perform(get_list)
    get_gym_index = open("https://map.crossfit.com/getAllAffiliates.php").read
    $redis_cache.setex("gymlist", 1.week.seconds, get_gym_index)
  end
end