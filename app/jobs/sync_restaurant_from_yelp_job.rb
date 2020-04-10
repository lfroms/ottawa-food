class SyncRestaurantFromYelpJob < ApplicationJob
  queue_as :urgent

  def perform(restaurant_id:)
    restaurant = Restaurant.find(restaurant_id)
    business = Yelp::YelpBusinessService.execute(yelp_id: restaurant.yelp_id).data.business

    restaurant.update(name: business.name, image_url: business.photos.first)
  end
end
