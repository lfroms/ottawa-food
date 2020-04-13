# frozen_string_literal: true
class BucketListItem < ApplicationRecord
  after_commit :update_user_recommendations

  enum status: { pending: 0, liked: 1, disliked: 2, neutral: 3 }

  belongs_to :user
  belongs_to :restaurant

  validates :user, uniqueness: { scope: :restaurant }

  def completed?
    !pending?
  end

  private

  def update_user_recommendations
    UpdateUserRecommendationsJob.perform_later(user_id: user.id)
  end
end
