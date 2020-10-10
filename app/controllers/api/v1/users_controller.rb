class Api::V1::UsersController < Api::V1::ApplicationController
  skip_before_action :authenticate_request!, only: %i[create authenticate]

  def create
    user = User.create!(
      email: create_params[:email],
      password: create_params[:password],
      password_confirmation: create_params[:password]
    )

    render json: payload(user)
  end

  def authenticate
    user = User.find_for_database_authentication(email: params[:email])

    if user&.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: { errors: ['Invalid email/password'] }, status: :unauthorized
    end
  end

  private

  def create_params
    params.permit(
      :email,
      :password
    )
  end

  def payload(user)
    { auth_token: JsonWebToken.encode({ user_id: user.id, exp: (Time.zone.now + 2.weeks).to_i }) }
  end
end
