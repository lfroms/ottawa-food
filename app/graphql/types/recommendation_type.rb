# frozen_string_literal: true
module Types
  class RecommendationType < Types::BaseObject
    field :id, ID, null: false
    field :restaurant, Types::RestaurantType, null: false
    field :index, Integer, null: false
  end
end
