# frozen_string_literal: true
class SyncRestaurantFromYelpJob < ApplicationJob
  queue_as :urgent

  def perform(yelp_id:)
    RestaurantYelpSyncService.execute(yelp_id: yelp_id)
  end
end
