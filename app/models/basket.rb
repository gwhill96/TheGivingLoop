class Basket < ApplicationRecord
  belongs_to :user, optional: true
  store :guest_user, accessors: %i[email first_name last_name phone_number], prefix: true, coder: JSON
  has_many :basket_items
  has_many :donation_types, through: :basket_items
  monetize :amount_cents

  def guest?
    user.nil? && guest_user.present?
  end
end
