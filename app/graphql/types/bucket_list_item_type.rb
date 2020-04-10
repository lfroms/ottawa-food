# frozen_string_literal: true
module Types
  class BucketListItemType < Types::BaseObject
    field :id, ID, null: false
    field :restaurant, Types::RestaurantType, null: false
    field :status, Types::BucketListItemStatusType, null: false
  end
end
