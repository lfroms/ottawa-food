class UpdateTrendingRestaurantsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    TrendingRestaurantsCalculateService.execute
  end
end
