class ChangeNullValueOfUserInBaskets < ActiveRecord::Migration[7.0]
  def change
    change_column_null :baskets, :user_id, true
  end
end
