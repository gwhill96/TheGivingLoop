class User < ApplicationRecord
  has_many :baskets
  has_many :basket_items, through: :baskets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  validates :phone_number, :address, presence: true
  validates :phone_number, :address, uniqueness: true
end
