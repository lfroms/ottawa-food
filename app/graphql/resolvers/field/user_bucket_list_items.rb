# frozen_string_literal: true
module Resolvers
  module Field
    class UserBucketListItems < Resolvers::Base
      type Types::BucketListItemType.connection_type, null: false

      argument :show_only_pending, Boolean, required: false

      def resolve(show_only_pending: false)
        if show_only_pending
          object.bucket_list_items.pending
        else
          object.bucket_list_items
        end
      end
    end
  end
end
