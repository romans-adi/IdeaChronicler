require 'jwt'

class TokenGenerator
  SECRET_KEY = "qx+ZnuZqUCXPEyBpq/OscAnbLslex56eC9zAkQ3YezKeOFKaVr6sdEscjUhGtYdzY2O+0b99g2wIw+g9XZbXAWDIy88PW6+euXgxO7QvH8KcTOdWbipFxYBuMmpOO6KZ0DYq6lKjry46Iy5+4J5qVcXH/FNSgL8zC7UhRcR/GwPSbOGPZfrS8vT6nSJZMUrQDKwpeTd1O7lrwKn+DyTkPvBwwFTQfgqxLBQw6Jg54XrRqcD7cebiCM+DpoGTdfgTVPBqeDQDGGBNDW1qmAWSNItknuhB43s16h0I+u9GdD9TCbN32lrRtOggkSRBPUWk/5CXUMVlhW/PoYHqQhly9dxd0I4+JbNBViXxusrJ5tSJZOBp8eYHex803cG5R44929hJRV+bXwfNe0tlOYG9ZmmML8Aqvehd97y/--cg301Ie1Rk2yB7ED--BDMxEnDSqd8qMgoCftj3lQ=="

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
