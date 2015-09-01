class Gym < ActiveRecord::Base
  validates :unique_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lat, presence: true
  validates :long, presence: true

  has_many :reviews, dependent: :destroy
  ratyrate_rateable "coaching", "pricing", "equipment", "location"

  def calculate_overall_average
    unique_dimensions = Rate.distinct.where(rateable_type: self.class.name).count('dimension')
    unique_rates = Rate.distinct.where(rateable: self).count('rater_id')
    total_rates = Rate.where(rateable: self).sum('stars')
    avg = (total_rates/(unique_dimensions*unique_rates).round(1)).round(1)
  end
end
