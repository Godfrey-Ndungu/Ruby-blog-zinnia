class AuthorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_author, only: [:edit, :update]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @user = User.find(params[:author][:user_id])
    @user = @user ? @user : current_user
    @author = Author.new(author_params.merge(user: @user))

    if Author.exists?(user_id: author_params[:user_id])
      flash.now[:alert] = 'Author with this user already exists.'
      render :new
    else
      if @author.save
        redirect_to author_path(@author), notice: 'Author was successfully created.'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to authors_path, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:full_name)
  end
end
