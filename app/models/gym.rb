class Gym < ActiveRecord::Base
  extend FriendlyId
  include PgSearch
  validates :unique_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lat, presence: true
  validates :long, presence: true
  has_many :reviews, dependent: :destroy

  friendly_id :name, use: [:slugged, :history]

  def calculate_average_rating
    (self.reviews.sum(:score) / reviews.size).round(2)
  rescue ZeroDivisionError
    0
  end

  def update_average_rating
    update_attributes(average_rating: calculate_average_rating)
  end
  
  pg_search_scope :search_any_word,
                :against => [:name, :city, :state, :country],
                :using => {
                  :tsearch => 
                    {tsvector_column: "tsv", 
                      :dictionary => "english", 
                      :any_word => true}
                },
                ignoring: :accents

end
