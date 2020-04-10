# frozen_string_literal: true
module Mutations
  class DeleteBucketListItem < BaseMutation
    field :bucket_list_item, Types::BucketListItemType, null: true

    argument :restaurant_id, ID, required: true

    def resolve(restaurant_id:)
      params = { restaurant_id: restaurant_id, user_id: context[:current_user] }

      {
        bucket_list_item: BucketListItemDeleteService.execute(params),
      }
    end
  end
end
