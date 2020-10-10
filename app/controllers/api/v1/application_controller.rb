class Api::V1::ApplicationController < ApplicationController
  rescue_from Exception do |error|
    render json: { errors: [error.message] }, status: :internal_server_error
  end

  rescue_from ActiveRecord::RecordInvalid do |error|
    render json: { errors: [error.message] }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: [error.message] }, status: :not_found
  end
end
