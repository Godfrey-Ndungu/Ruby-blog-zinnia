class Category < ApplicationRecord
  has_many :articles
  validates :name, presence: true, uniqueness: true, length: { in: 4..32 }
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize if name.present?
  end

end
