# frozen_string_literal: true
module AppleId
  class Validator
    APPLE_PEM_URL = 'https://appleid.apple.com/auth/keys'

    def self.validate(name:, jwt:)
      header_segment = JSON.parse(Base64.decode64(jwt.split('.').first))
      alg = header_segment['alg']

      apple_response = Net::HTTP.get(URI.parse(APPLE_PEM_URL))
      apple_certificate = JSON.parse(apple_response)

      key_hash = HashWithIndifferentAccess.new(apple_certificate['keys'][0])
      jwk = JWT::JWK.import(key_hash)

      token_data = JWT.decode(jwt, jwk.public_key, true, { algorithm: alg })[0]

      user = UserCreateService.execute(name: name, email: token_data['email'], apple_identity: token_data['sub'])

      token = JsonWebToken::Coder.encode({ user_id: user.id })

      [user, token]

    rescue StandardError => e
      raise GraphQL::ExecutionError, e
    end
  end
end
