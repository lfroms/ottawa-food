# frozen_string_literal: true
class BucketListItemCreateService < UseCaseService
  def execute(user_id:, restaurant_id:)
    BucketListItem.create(user_id: user_id, restaurant_id: restaurant_id)
  end
end
