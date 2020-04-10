# frozen_string_literal: true
class SyncRestaurantFromYelpJob < ApplicationJob
  queue_as :urgent

  def perform(restaurant_id:)
    restaurant = Restaurant.find(restaurant_id)
    business = Yelp::Business.get(yelp_id: restaurant.yelp_id).data.business

    restaurant.update(name: business.name, image_url: business.photos.first)
  end
end
