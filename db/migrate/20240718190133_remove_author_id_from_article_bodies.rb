class RemoveAuthorIdFromArticleBodies < ActiveRecord::Migration[6.1]
  def change
    remove_column :article_bodies, :author_id, :integer
  end
end
