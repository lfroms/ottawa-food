# frozen_string_literal: true
module Mutations
  class ToggleFavoriteRestaurant < BaseMutation
    field :restaurant, Types::RestaurantType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      RestaurantFavoriteToggleService.execute(user_id: context[:current_user], restaurant_id: id)
    end
  end
end
