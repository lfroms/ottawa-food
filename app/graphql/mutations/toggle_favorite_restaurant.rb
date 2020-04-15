# frozen_string_literal: true
module Mutations
  class ToggleFavoriteRestaurant < AuthorizedMutation
    field :restaurant, Types::RestaurantType, null: false

    argument :yelp_id, ID, required: true

    def resolve(yelp_id:)
      RestaurantFavoriteToggleService.execute(user_id: context[:current_user].id, yelp_id: yelp_id)
    end
  end
end
