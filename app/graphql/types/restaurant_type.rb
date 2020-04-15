# frozen_string_literal: true
module Types
  class RestaurantType < Types::BaseObject
    field :id, ID, null: false
    field :yelp_id, String, null: false
    field :name, String, null: true
    field :image_url, String, null: true
    field :yelp_url, String, null: true
    field :phone, String, null: true
    field :yelp_rating, String, null: true
    field :price_level, String, null: true
    field :favorite, Boolean, null: false
    field :in_bucket_list, Boolean, null: false

    def favorite
      object.favorite?(user_id: context[:current_user].id)
    end

    def in_bucket_list
      object.in_bucket_list?(user_id: context[:current_user].id)
    end
  end
end
