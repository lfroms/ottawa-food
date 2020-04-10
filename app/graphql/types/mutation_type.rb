# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :toggle_favorite_restaurant, mutation: Mutations::ToggleFavoriteRestaurant
  end
end
