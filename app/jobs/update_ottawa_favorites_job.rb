# frozen_string_literal: true
class UpdateOttawaFavoritesJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    OttawaFavoritesUpdateService.execute
  end
end
