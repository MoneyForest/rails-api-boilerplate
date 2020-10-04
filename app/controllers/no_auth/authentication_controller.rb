class NoAuth::AuthenticationController < NoAuth::ApplicationController
  def authenticate_user
    user = User.find_for_database_authentication(email: params[:email])
    if user&.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: { errors: ['Invalid Username/Password'] }, status: :unauthorized
    end
  end

  private

  def payload(user)
    {
      auth_token: JsonWebToken.encode({ user_id: user.id, exp: (Time.zone.now + 2.weeks).to_i }),
      user: { id: user.id, email: user.email }
    }
  end
end
