require 'jwt'

JWT_ALGORITHM = 'HS256'
JWT_SECRET_KEY = Rails.application.secret_key_base
EXPIRE_TOKEN = 10.minutes.from_now

module Jwt
  class << self
    def encode(payload, exp = EXPIRE_TOKEN)
      payload[:exp] = exp.to_i
      JWT.encode(payload, JWT_SECRET_KEY, JWT_ALGORITHM)
    end

    def decode(token)
      JWT.decode(token, JWT_SECRET_KEY, true, algorithm: JWT_ALGORITHM)[0]
    end
  end
end
