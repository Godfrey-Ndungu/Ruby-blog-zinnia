class User < ApplicationRecord
  rolify

  has_one :author

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, foreign_key: 'author_id'
  has_many :article_bodies, through: :articles
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
