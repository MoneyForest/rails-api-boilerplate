class ApplicationController < ActionController::API
  attr_reader :current_user

  protected

  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[0]["user_id"])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private

  def bearer_token
    @bearer_token ||= (request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?)
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(bearer_token)
  end

  def user_id_in_token?
    return false unless auth_token
    User.find(auth_token[0]["user_id"]).present?
  end
end
