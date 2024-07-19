class RemoveArticleBodiesAndAddBodyToArticles < ActiveRecord::Migration[6.1]
  def change
  drop_table :article_bodies do |t|
    t.text :body
    t.references :article, null: false, foreign_key: true
    t.timestamps
  end

  add_column :articles, :body, :text
  end
end
