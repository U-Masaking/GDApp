Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  get 'users/index'
  get '/users' => 'users#form'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
