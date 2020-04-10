# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :create_bucket_list_item, mutation: Mutations::CreateBucketListItem
    field :update_bucket_list_item, mutation: Mutations::UpdateBucketListItem
    field :delete_bucket_list_item, mutation: Mutations::DeleteBucketListItem

    field :toggle_favorite_restaurant, mutation: Mutations::ToggleFavoriteRestaurant
  end
end
