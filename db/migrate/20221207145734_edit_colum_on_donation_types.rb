class EditColumOnDonationTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :donation_types, :status
  end
end
