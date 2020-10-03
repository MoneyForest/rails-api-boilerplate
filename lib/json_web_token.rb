# frozen_string_literal: true

class JsonWebToken
  class << self
    def encode(payload)
      JWT.encode(
        payload,
        Rails.application.credentials.config[:secret_key_base]
      )
    rescue StandardError
      nil
    end

    def decode(token)
      HashWithIndifferentAccess.new(
        JWT.decode(
          token,
          Rails.application.credentials.config[:secret_key_base]
        )[0]
      )
    rescue StandardError
      nil
    end
  end
end