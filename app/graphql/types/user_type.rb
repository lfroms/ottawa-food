# frozen_string_literal: true
module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :favorite_restaurants, RestaurantType.connection_type, null: false
    field :bucket_list_items, BucketListItemType.connection_type, null: false do
      argument :show_only_pending, Boolean, required: false
    end

    def bucket_list_items(show_only_pending: false)
      if show_only_pending
        object.bucket_list_items.pending
      else
        object.bucket_list_items
      end
    end
  end
end
