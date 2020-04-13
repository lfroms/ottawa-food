# frozen_string_literal: true
class BucketListItemDeleteService < UseCaseService
  def execute(yelp_id:, user_id:)
    restaurant = Restaurant.find_by(yelp_id: yelp_id)
    item = BucketListItem.find_by(restaurant: restaurant, user_id: user_id)

    return nil if item.blank?

    item.destroy
  end
end
