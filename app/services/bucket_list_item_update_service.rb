# frozen_string_literal: true
class BucketListItemUpdateService < UseCaseService
  def execute(yelp_id:, user_id:, status:)
    restaurant = Restaurant.find_by(yelp_id: yelp_id)
    item = BucketListItem.find_by(restaurant: restaurant, user_id: user_id)

    return nil if item.blank?

    item.update(status: status)
    item
  end
end
