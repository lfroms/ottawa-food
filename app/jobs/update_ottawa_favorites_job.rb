# frozen_string_literal: true
class UpdateOttawaFavoritesJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    OttawaFavoritesCalculateService.execute
  end
end
