# frozen_string_literal: true
module Mutations
  class CreateOrRetrieveRestaurant < AuthorizedMutation
    field :restaurant, Types::RestaurantType, null: false

    argument :yelp_id, ID, required: true

    def resolve(yelp_id:)
      {
        restaurant: Restaurant.find_otherwise_create(yelp_id: yelp_id),
      }
    end
  end
end
