class CreateBasketItems < ActiveRecord::Migration[7.0]
  def change
    create_table :basket_items do |t|
      t.references :basket, null: false, foreign_key: true
      t.references :donation_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
