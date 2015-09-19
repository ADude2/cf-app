class User < ActiveRecord::Base
  extend FriendlyId
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }, :uniqueness => {:case_sensitive => false}
  has_many :reviews, dependent: :destroy

  friendly_id :user_name, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end

  def admin?
    role == "admin"
  end
end
