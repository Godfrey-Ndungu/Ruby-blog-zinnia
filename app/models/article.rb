class Article < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :article_bodies
  has_many :editors, through: :article_bodies, source: :author

  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true

  private
  def generate_slug
    self.slug = "#{title.parameterize}" if title
  end

  def ensure_unique_slug
    if slug.blank? || Article.exists?(slug: slug)
      self.slug = "#{slug}-#{id}" if slug.present?
    end
  end
end
