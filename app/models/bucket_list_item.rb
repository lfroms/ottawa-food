# frozen_string_literal: true
class BucketListItem < ApplicationRecord
  enum status: { pending: 0, liked: 1, disliked: 2, neutral: 3 }

  belongs_to :user
  belongs_to :restaurant

  validates :user, uniqueness: { scope: :restaurant }

  def completed?
    !pending?
  end
end
