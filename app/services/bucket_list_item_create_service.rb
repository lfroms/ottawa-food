# frozen_string_literal: true
class BucketListItemCreateService < UseCaseService
  def execute(user_id:, yelp_id:)
    restaurant = Restaurant.find_by(yelp_id: yelp_id)
    new_item = BucketListItem.create(user_id: user_id, restaurant: restaurant)

    if new_item.id.nil?
      BucketListItem.find_by(user_id: user_id, restaurant: restaurant)
    else
      new_item
    end
  end
end
