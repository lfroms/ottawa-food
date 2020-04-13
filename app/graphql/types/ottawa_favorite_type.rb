# frozen_string_literal: true
module Types
  class OttawaFavoriteType < Types::BaseObject
    field :id, ID, null: false
    field :restaurant, Types::RestaurantType, null: false
    field :index, Integer, null: false
    field :score, Float, null: false
  end
end
