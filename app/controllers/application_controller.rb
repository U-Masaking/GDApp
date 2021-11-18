class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    #devieseコントローラーのアクション実行前にパラメーターを確認する
    before_action :configure_permitted_parameters, if: :devise_controller?


    def configure_permitted_parameters
        #新規登録時に名前を保存できるようにする
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        #アカウント編集時にnameを保存できるようにする
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :introduction])
    end 
end
