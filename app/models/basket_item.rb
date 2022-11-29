class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :donation_type
end
