class Restaurant < ApplicationRecord
  validates :yelp_id, null: false

  has_many :users, through: :favorites
end
