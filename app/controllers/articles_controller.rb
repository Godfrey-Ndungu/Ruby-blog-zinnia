class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @categories = Category.all
  end

  def show
    @article = Article.find_by(slug: params[:slug])
  end

end
