class DonationType < ApplicationRecord
  belongs_to :charity_profile
  has_many :basket_items, dependent: :destroy
  has_many :baskets, through: :basket_items
  validates :name, presence: true
  validates :name, length: { maximum: 50 }
  validates :price, presence: true
  monetize :price_cents
  # Redeemed validations?

  # def number_to_currency_gbp(number)
  #   number_to_currency(number, { unit: “£”})
  # end
end
