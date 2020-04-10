module Types
  class RestaurantType < Types::BaseObject
    field :id, ID, null: false
    field :yelpId, String, null: false
    field :name, String, null: false
    field :image, String, null: false
  end
end
