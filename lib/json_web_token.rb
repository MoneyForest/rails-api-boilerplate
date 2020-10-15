# frozen_string_literal: true

class JsonWebToken
  class << self
    def encode(payload)
      JWT.encode(
        payload,
        '0c31e7f7da70866fe43d4f2cb93a56c2'
      )
    end

    def decode(token)
      HashWithIndifferentAccess.new(
        JWT.decode(
          token,
          '0c31e7f7da70866fe43d4f2cb93a56c2'
        )[0]
      )
    rescue StandardError
      nil
    end
  end
end
