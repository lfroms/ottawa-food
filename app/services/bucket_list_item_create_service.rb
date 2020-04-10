# frozen_string_literal: true
class BucketListItemCreateService < UseCaseService
  def execute(user_id:, restaurant_id:)
    new_item = BucketListItem.create(user_id: user_id, restaurant_id: restaurant_id)

    if new_item.id.nil?
      BucketListItem.find_by(user_id: user_id, restaurant_id: restaurant_id)
    else
      new_item
    end
  end
end
