class GymrefreshesWorker
  include Sidekiq::Worker
  require 'open-uri'

  def perform(gym_id)
    puts gym_id
  end
end