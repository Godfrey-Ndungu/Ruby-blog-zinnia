class Author < ApplicationRecord
  belongs_to :user
  has_many :articles
  validates :full_name, presence: true
end
