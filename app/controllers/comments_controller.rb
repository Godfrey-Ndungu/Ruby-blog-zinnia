class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :check_comment_owner, only: [:edit, :update, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to article_path(@article.slug), notice: 'Comment was successfully created.'
    else
      redirect_to @article, alert: 'Error creating comment.'
    end
  end

  def edit
    redirect_to article_path(@article.slug), alert: 'Not authorized' unless @comment.user == current_user
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_path(@article.slug), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def set_article
    @article = Article.find_by(slug: params[:article_slug])
    unless @article
      redirect_to articles_path, alert: 'Article not found.'
    end
  end

  def destroy
    redirect_to article_path(@article.slug), alert: 'Not authorized' unless @comment.user == current_user
    @comment.destroy
    redirect_to article_path(@article.slug), notice: 'Comment was successfully deleted.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def check_comment_owner
    unless @comment.user == current_user
      redirect_to @comment.article, alert: 'You are not authorized to perform this action.'
    end
  end
end
