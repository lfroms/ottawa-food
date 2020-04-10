# frozen_string_literal: true
module Mutations
  class UpdateBucketListItem < BaseMutation
    field :bucket_list_item, Types::BucketListItemType, null: true

    argument :restaurant_id, ID, required: true
    argument :status, Types::BucketListItemStatusType, required: true

    def resolve(restaurant_id:, status:)
      params = { restaurant_id: restaurant_id, user_id: context[:current_user], status: status }

      {
        bucket_list_item: BucketListItemUpdateService.execute(params),
      }
    end
  end
end
