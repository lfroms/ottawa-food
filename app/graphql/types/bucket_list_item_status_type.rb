# frozen_string_literal: true
module Types
  class BucketListItemStatusType < Types::BaseEnum
    value 'pending', 0
    value 'liked', 1
    value 'disliked', 2
    value 'neutral', 3
  end
end
