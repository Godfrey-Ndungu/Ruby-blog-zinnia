class User < ApplicationRecord
  rolify

  has_one :author

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :articles, foreign_key: 'author_id'
  has_many :article_bodies, through: :articles
  has_many :comments, dependent: :destroy
  has_many :article_likes, dependent: :destroy
  has_many :liked_articles, through: :article_likes, source: :article

  before_create :generate_registration_token

  def generate_registration_token
    self.registration_token = SecureRandom.hex(10)
  end

  def send_registration_email
    UserMailer.registration_token(self).deliver_now
  end
end
