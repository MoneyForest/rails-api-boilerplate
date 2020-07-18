Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        passwords: 'api/v1/auth/passwords',
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }
    end
  end
end
