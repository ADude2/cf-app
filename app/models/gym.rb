class Gym < ActiveRecord::Base
  validates :unique_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lat, presence: true
  validates :long, presence: true

  has_many :reviews, dependent: :destroy
end
