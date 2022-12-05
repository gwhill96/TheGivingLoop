class RemoveRedeemedFromDonationTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :donation_types, :redeemed
  end
end
