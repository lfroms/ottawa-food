# frozen_string_literal: true
module Types
  class QueryType < Types::BaseObject
    field :current_user, UserType, null: true do
      description "Retrieve my profile."
    end

    def current_user
      User.find_by(id: context[:current_user])
    end
  end
end
