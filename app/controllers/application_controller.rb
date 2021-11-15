class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    #devieseコントローラーのアクション実行前にパラメーターを確認する
    before_action :configure_permitted_parameters, if: :devise_controller?
end
