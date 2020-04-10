class Restaurant < ApplicationRecord
  after_create :sync_from_yelp

  validates :yelp_id, presence: true
  has_many :users, through: :favorites

  def sync_from_yelp
    SyncRestaurantFromYelpJob.perform_later(restaurant_id: id)
  end
end
