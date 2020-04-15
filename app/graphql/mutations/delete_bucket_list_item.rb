# frozen_string_literal: true
module Mutations
  class DeleteBucketListItem < AuthorizedMutation
    field :bucket_list_item, Types::BucketListItemType, null: true

    argument :yelp_id, ID, required: true

    def resolve(yelp_id:)
      params = { yelp_id: yelp_id, user_id: context[:current_user].id }

      {
        bucket_list_item: BucketListItemDeleteService.execute(params),
      }
    end
  end
end
