# frozen_string_literal: true
module Resolvers
  module Field
    class UserRecommendations < Resolvers::Base
      type Types::RecommendationType.connection_type, null: false

      def resolve
        UserRecommendationsRetrieveService.execute(user_id: object.id)
      end
    end
  end
end
