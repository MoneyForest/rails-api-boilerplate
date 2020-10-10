Rails.application.routes.draw do
  # devise_for :users
  resources :healthz, only: %(index)

  namespace :api do
    namespace :v1 do
      post 'users' => 'users#create'
      post 'users/authenticate' => 'users#authenticate'
      resources :projects, only: %i[index show create update destroy]
      resources :tasks, only: %i[index show create update destroy]
      resources :teams, only: %i[index show create update destroy]
      resources :healthz, only: %(index)
    end
  end

  namespace :no_auth do
    resources :healthz, only: %(index)
  end
end
