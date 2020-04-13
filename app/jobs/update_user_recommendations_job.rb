# frozen_string_literal: true
class UpdateUserRecommendationsJob < ApplicationJob
  queue_as :default

  def perform(user_id:)
    UserRecommendationsUpdateService.execute(user_id: user_id)
  end
end
