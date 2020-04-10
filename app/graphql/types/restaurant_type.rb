module Types
  class RestaurantType < Types::BaseObject
    field :id, ID, null: false
    field :yelp_id, String, null: false
    field :name, String, null: false
    field :image_url, String, null: true
  end
end
