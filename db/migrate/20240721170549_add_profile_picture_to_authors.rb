class AddProfilePictureToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :profile_picture, :string
  end
end
