class AddFullNameToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :full_name, :string
  end
end
