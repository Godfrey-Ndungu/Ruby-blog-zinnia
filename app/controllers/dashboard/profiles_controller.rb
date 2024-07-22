module Dashboard
  class Dashboard::ProfilesController < ApplicationController
    layout 'dashboard'

    def index
      @user = current_user
      @author = @user.author
    end
  end
end
