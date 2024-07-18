class CreateArticleBodies < ActiveRecord::Migration[6.1]
  def change
    create_table :article_bodies do |t|
      t.references :article, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
