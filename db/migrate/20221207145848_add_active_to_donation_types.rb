class AddActiveToDonationTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :donation_types, :active, :boolean, default: true, null: false
  end
end
