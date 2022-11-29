class CreateDonationTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :donation_types do |t|
      t.string :name
      t.float :price
      t.boolean :redeemed
      t.references :charity_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
