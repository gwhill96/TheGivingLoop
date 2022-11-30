class AddGuestUserToBaskets < ActiveRecord::Migration[7.0]
  def change
    add_column :baskets, :guest_user, :jsonb
  end
end
