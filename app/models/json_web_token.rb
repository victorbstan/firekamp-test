# frozen_string_literal: true

class JsonWebToken
  SECRET_KEY = ENV['API_SECRET_TOKEN']

  def self.encode(payload, exp = 24.hours.from_now)
    payload['exp'] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    HashWithIndifferentAccess.new decoded
  end
end
