# frozen_string_literal: true
class Restaurant < ApplicationRecord
  after_create_commit :sync_from_yelp

  validates :yelp_id, presence: true, uniqueness: true
  validates :yelp_url, format: { with: /#{URI.regexp}/ }, allow_nil: true
  validates :phone, presence: false
  validates :yelp_rating, presence: false
  validates :price_level, presence: false

  has_many :favorites, dependent: :destroy
  has_many :bucket_list_items, dependent: :destroy

  def favorite?(user_id:)
    favorites.exists?(user_id: user_id)
  end

  def in_bucket_list?(user_id:)
    bucket_list_items.exists?(user_id: user_id)
  end

  def sync_from_yelp
    SyncRestaurantFromYelpJob.perform_later(yelp_id: yelp_id)
  end
end
