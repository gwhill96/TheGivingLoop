class User < ApplicationRecord
  has_many :baskets, dependent: :destroy
  has_many :basket_items, through: :baskets
  has_one :charity_profile, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  validates :phone_number, :address, presence: true
  validates :phone_number, :address, uniqueness: true

  # def initialize
  #   Basket.create!(user:id)

  # after_create :create_basket

  # def after_database_authentication
  #   Basket.create!(user_id: current_user.id)
  # end

  # def create_basket
  #   Basket.create!(user_id: current_user)
  #   raise
  # end
end
