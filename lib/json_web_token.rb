class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, ENV.fetch('secret_key_base', nil))
  end

  def self.decode(token)
    HashWithIndifferentAccess.new(JWT.decode(token, ENV.fetch('secret_key_base', nil))[0])
  rescue StandardError
    nil
  end
end
