# frozen_string_literal: true
class UpdateTrendingRestaurantsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    TrendingRestaurantsUpdateService.execute
  end
end
