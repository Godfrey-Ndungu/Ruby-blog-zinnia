class AddHeaderImageToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :header_image, :string
  end
end
