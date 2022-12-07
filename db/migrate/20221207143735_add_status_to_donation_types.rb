class AddStatusToDonationTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :donation_types, :status, :string, default: 'active', null: false
  end
end
