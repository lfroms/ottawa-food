# frozen_string_literal: true
module Resolvers
  class TrendingRestaurants < Resolvers::Base
    type Types::TrendingRestaurantType.connection_type, null: false

    def resolve
      TrendingRestaurant.includes(:restaurant).all.order(:index)
    end
  end
end
