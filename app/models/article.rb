class Article < ApplicationRecord
  has_one_attached :header_image

  belongs_to :author
  belongs_to :category
  has_and_belongs_to_many :tags

  has_many :editors, through: :article_bodies, source: :author
  has_many :comments, dependent: :destroy
  has_many :article_likes, dependent: :destroy
  has_many :liked_by_users, through: :article_likes, source: :user

  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true

  before_validation :generate_slug, on: :create
  before_validation :ensure_unique_slug

  def likes_count
    article_likes.count
  end

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
