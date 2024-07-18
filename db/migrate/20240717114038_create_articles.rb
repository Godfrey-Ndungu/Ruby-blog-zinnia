class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :author, null: false, foreign_key: true
      t.string :slug
      t.string :title
      t.references :category, null: false, foreign_key: true
      t.string :state
      t.datetime :active_till

      t.timestamps
    end
  end
end
