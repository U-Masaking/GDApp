class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:form]
  
  def index
    @user = current_user
    @posts = @user.posts
  end

  def form
    if user_signed_in?
      redirect_to edit_user_registration_path
    else
      redirect_to new_user_registration_path
    end
  end
end
