class Gym < ActiveRecord::Base
  validates :unique_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lat, presence: true
  validates :long, presence: true

  def self.update_or_create(attributes)
    assign_or_new(attributes).save
  end

  def update_or_create!(attributes)
    assign_or_new(attributes).save!
  end

  def self.assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj
  end
end
