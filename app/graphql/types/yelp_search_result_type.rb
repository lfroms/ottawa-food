# frozen_string_literal: true
module Types
  class YelpSearchResultType < Types::BaseObject
    field :yelp_id, String, null: false
    field :name, String, null: false
    field :address, String, null: false
  end
end
