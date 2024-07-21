module Dashboard
  class BlogsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article, only: [:edit, :update]
    layout 'dashboard'

    def index
      @articles = current_user.author.articles.all
    end

    def new
      @article = Article.new
    end

    def create
      @article = current_user.author.articles.new(article_params)

      if @article.save
        redirect_to dashboard_blogs_path, notice: 'Blog was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @article.update(article_params)
        redirect_to dashboard_blogs_path, notice: 'Blog was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to dashboard_blogs_path, notice: 'Article was successfully deleted.'
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :header_image, :category_id)
    end
  end
end
