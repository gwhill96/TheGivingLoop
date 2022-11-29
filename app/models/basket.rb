class Basket < ApplicationRecord
  belongs_to :user
  has_many :basket_items
  has_many :donation_types, through: :basket_items
end
