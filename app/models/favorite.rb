# frozen_string_literal: true
class Favorite < ApplicationRecord
  after_commit :update_user_recommendations

  belongs_to :user
  belongs_to :restaurant

  private

  def update_user_recommendations
    UpdateUserRecommendationsJob.perform_later(user_id: user.id)
  end
end
