class Restaurant < ApplicationRecord
  validates :yelp_id, null: false
end
