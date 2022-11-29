class ChangeDefaultValueOfRedeemedInDonationTypes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :donation_types, :redeemed, false
  end
end
