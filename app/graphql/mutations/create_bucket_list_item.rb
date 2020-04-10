# frozen_string_literal: true
module Mutations
  class CreateBucketListItem < BaseMutation
    field :bucket_list_item, Types::BucketListItemType, null: false

    argument :restaurant_id, ID, required: true

    def resolve(restaurant_id:)
      params = { user_id: context[:current_user], restaurant_id: restaurant_id }

      {
        bucket_list_item: BucketListItemCreateService.execute(params),
      }
    end
  end
end
