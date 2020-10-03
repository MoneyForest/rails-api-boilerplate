Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  post 'auth_user' => 'authentication#authenticate_user'
end
