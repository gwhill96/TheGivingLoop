class AddPriceToDonationTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :donation_types, :price
    add_monetize :donation_types, :price, currency: { present: false }
  end
end
