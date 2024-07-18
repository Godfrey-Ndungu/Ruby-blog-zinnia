class ArticleLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find_by(slug: params[:article_slug])
    @like = @article.article_likes.find_or_initialize_by(user: current_user)

    if @like.save
      redirect_to article_path(@article.slug), notice: 'You liked this article.'
    else
      redirect_to article_path(@article.slug), alert: 'Unable to like this article.'
    end
  end

  def destroy
    @article = Article.find_by(slug: params[:article_slug])
    @like = @article.article_likes.find_by(user: current_user)

    if @like&.destroy
      redirect_to article_path(@article.slug), notice: 'You unliked this article.'
    else
      redirect_to article_path(@article.slug), alert: 'Unable to unlike this article.'
    end
  end
end
