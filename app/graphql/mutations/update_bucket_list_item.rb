# frozen_string_literal: true
module Mutations
  class UpdateBucketListItem < AuthorizedMutation
    field :bucket_list_item, Types::BucketListItemType, null: true

    argument :yelp_id, ID, required: true
    argument :status, Types::BucketListItemStatusType, required: true

    def resolve(yelp_id:, status:)
      params = { yelp_id: yelp_id, user_id: context[:current_user].id, status: status }

      {
        bucket_list_item: BucketListItemUpdateService.execute(params),
      }
    end
  end
end
