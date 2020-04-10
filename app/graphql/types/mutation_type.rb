# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :create_bucket_list_item, mutation: Mutations::CreateBucketListItem
    field :toggle_favorite_restaurant, mutation: Mutations::ToggleFavoriteRestaurant
  end
end
