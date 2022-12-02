class CharityProfile < ApplicationRecord
  belongs_to :user
  has_many :donation_types, dependent: :destroy
end
