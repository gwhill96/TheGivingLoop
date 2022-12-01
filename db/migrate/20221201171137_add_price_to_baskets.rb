class AddPriceToBaskets < ActiveRecord::Migration[7.0]
  def change
    add_monetize :baskets, :amount, currency: { present: false }
    add_column :baskets, :state, :string
    add_column :baskets, :checkout_session_id, :string
  end
end
