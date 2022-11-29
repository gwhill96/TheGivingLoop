class ChangeDefaultValueOfCharityInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :charity, false
  end
end
