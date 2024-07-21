class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  def index
    @authors = Author.all
    @articles = Article.all
    @total_likes = Like.count
    @top_articles = Article.joins(:comments).group('articles.id').order('count(comments.id) DESC').limit(3)
  end

  def articles
    @articles = Article.all
  end
end
