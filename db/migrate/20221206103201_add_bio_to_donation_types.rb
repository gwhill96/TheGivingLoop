class AddBioToDonationTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :donation_types, :bio, :string
  end
end
