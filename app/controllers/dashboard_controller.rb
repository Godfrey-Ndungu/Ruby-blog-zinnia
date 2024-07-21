class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  def index
  end

  def articles
    @articles = Article.all
  end
end
