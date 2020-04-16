# frozen_string_literal: true
module Types
  class RecommendationType < Types::BaseObject
    field :restaurant, Types::RestaurantType, null: false
    field :index, Integer, null: false
    field :score, Float, null: false
  end
end
