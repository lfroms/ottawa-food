# frozen_string_literal: true
class SyncRestaurantDetailsFromYelpPageJob < ApplicationJob
  queue_as :urgent

  def perform(restaurant_id:)
    restaurant = Restaurant.find(restaurant_id)

    Yelp::ScrapeDetailsFromYelpPageService.execute(yelp_id: restaurant.yelp_id)
  end
end
