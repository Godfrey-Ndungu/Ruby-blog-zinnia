class ArticleBody < ApplicationRecord
  belongs_to :article
  has_rich_text :body
end
