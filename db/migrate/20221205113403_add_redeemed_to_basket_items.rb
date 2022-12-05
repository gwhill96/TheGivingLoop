class AddRedeemedToBasketItems < ActiveRecord::Migration[7.0]
  def change
    add_column :basket_items, :redeemed, :boolean, default: false, null: false
  end
end
