module ApplicationHelper
  def gym_rated(gym)
    if gym.average_rating.nil?
      "No Reviews Yet"
    else
      gym.average_rating
    end
  end
end