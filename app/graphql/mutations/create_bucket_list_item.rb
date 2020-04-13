# frozen_string_literal: true
module Mutations
  class CreateBucketListItem < BaseMutation
    field :bucket_list_item, Types::BucketListItemType, null: false

    argument :yelp_id, ID, required: true

    def resolve(yelp_id:)
      params = { user_id: context[:current_user], yelp_id: yelp_id }

      {
        bucket_list_item: BucketListItemCreateService.execute(params),
      }
    end
  end
end
