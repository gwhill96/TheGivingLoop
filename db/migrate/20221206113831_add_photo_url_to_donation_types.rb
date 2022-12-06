class AddPhotoUrlToDonationTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :donation_types, :photo_url, :string
  end
end
