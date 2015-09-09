class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  has_many :reviews, dependent: :destroy

  def admin?
    role == "admin"
  end
end
