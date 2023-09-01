require 'jwt'

class TokenGenerator
  SECRET_KEY = Rails.application.credentials.fetch(:secret_key_base)

  def self.generate_authentication_token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def self.verify_authentication_token(token)
    decoded_payload = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    decoded_payload.first
  rescue JWT::DecodeError
    nil
  end
end
