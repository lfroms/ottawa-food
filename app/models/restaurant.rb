# frozen_string_literal: true
class Restaurant < ApplicationRecord
  after_create_commit :sync_from_yelp

  validates :yelp_id, presence: true

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, dependent: :destroy

  def sync_from_yelp
    SyncRestaurantFromYelpJob.perform_later(restaurant_id: id)
    SyncRestaurantDetailsFromYelpPageJob.perform_later(restaurant_id: id)
  end
end
