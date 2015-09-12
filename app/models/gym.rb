class Gym < ActiveRecord::Base
  extend FriendlyId
  validates :unique_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lat, presence: true
  validates :long, presence: true
  has_many :reviews, dependent: :destroy

  friendly_id :name, use: [:slugged, :history]

  def average_rating
    (self.reviews.sum(:score) / reviews.size).round(2)
  rescue ZeroDivisionError
    0
  end
end
