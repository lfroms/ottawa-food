# frozen_string_literal: true
module Mutations
  class ValidateAppleId < BaseMutation
    description 'Validates an Apple ID JWT and returns an app JWT for authentication purposes.'

    field :token, String, null: true

    argument :name, String, required: true
    argument :token, String, required: true

    def resolve(name:, token:)
      token = AppleId::Validator.validate(name: name, jwt: token)

      {
        token: token,
      }
    end
  end
end
