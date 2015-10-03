class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :gym
  after_save :update_gym_rating

  validates :user_id, presence: true
  validates :gym_id, presence: true
  validates :content, presence: true, length: { minimum: 5 }
  validates :coaching, presence: true
  validates :equipment, presence: true
  validates :pricing, presence: true
  validates :location, presence: true
  validates :score, presence: true

  default_scope { order('created_at DESC') }

  def update_gym_rating
    gym.update_average_rating
  end
end
