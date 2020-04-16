# frozen_string_literal: true
class Restaurant < ApplicationRecord
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

  def self.find_otherwise_create(yelp_id:)
    restaurant = find_by(yelp_id: yelp_id)

    return restaurant unless restaurant.nil?

    create(yelp_id: yelp_id)
  end
end
