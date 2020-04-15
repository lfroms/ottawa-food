# frozen_string_literal: true
module Mutations
  class AuthorizedMutation < BaseMutation
    def initialize(options)
      super(options)
      authorize_user
    end

    protected

    def authorize_user
      return true if context[:current_user].present?

      # TODO: Implement proper UserError
      raise GraphQL::ExecutionError, 'Invalid user'
    end
  end
end
