class Api::V1::ApplicationController < ApplicationController
  rescue_from Exception do |e|
    render json: { errors: [e.message] }, status: :internal_server_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { errors: [e.message] }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { errors: [e.message] }, status: :not_found
  end

  private

  def forbidden(message)
    render json: { errors: [message] }, status: :forbidden
  end
end
