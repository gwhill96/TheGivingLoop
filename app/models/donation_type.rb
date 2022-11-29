class DonationType < ApplicationRecord
  belongs_to :charity_profile
  has_many :basket_items
  validates :name, presence: true
  validates :name, length: { maximum: 50 }
  validates :price, presence: true
  # Redeemed validations?
end
