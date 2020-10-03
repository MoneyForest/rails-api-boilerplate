Rails.application.routes.draw do
  # devise_for :users
  post 'auth_user' => 'authentication#authenticate_user'

  resources :healthz, only: %(index)

  namespace :api do
    namespace :v1 do
      resources :teams, only: %i[index show create update destroy]
      resources :healthz, only: %(index)
    end
  end

  namespace :no_auth do
    resources :healthz, only: %(index)
  end
end
