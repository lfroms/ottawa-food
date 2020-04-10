# frozen_string_literal: true
class SyncRestaurantDetailsFromYelpPageJob < ApplicationJob
  queue_as :urgent

  def perform(yelp_id:)
    RestaurantYelpScrapeService.execute(yelp_id: yelp_id)
  end
end
