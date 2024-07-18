class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @categories = Category.all
  end

  def show
    @article = Article.find_by(slug: params[:slug])
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find_by(slug: params[:slug])
    unless @article
      redirect_to articles_path, alert: 'Article not found.'
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :slug)
  end

end
