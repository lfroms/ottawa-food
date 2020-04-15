# frozen_string_literal: true
module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :favorite_restaurants, RestaurantType.connection_type, null: false
    field :bucket_list_items, resolver: Resolvers::Field::UserBucketListItems
    field :recommendations, resolver: Resolvers::Field::UserRecommendations
  end
end
