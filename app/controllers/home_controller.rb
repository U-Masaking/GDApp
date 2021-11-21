class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    if user_signed_in?
      redirect_to users_index_path
    end
  end
end
