class Author < ApplicationRecord
  belongs_to :user
  has_many :articles
  validates :full_name, presence: true
  validate :user_not_already_author

  private

  def user_not_already_author
    if user && Author.exists?(user: user)
      errors.add(:user, 'is already an author')
    end
  end
end
