class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :gym

  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 5 }
end
