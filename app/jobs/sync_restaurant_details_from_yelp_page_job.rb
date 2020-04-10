# frozen_string_literal: true
class SyncRestaurantDetailsFromYelpPageJob < ApplicationJob
  queue_as :urgent

  def perform(yelp_id:)
    Yelp::ScrapeDetailsFromYelpPageService.execute(yelp_id: yelp_id)
  end
end
