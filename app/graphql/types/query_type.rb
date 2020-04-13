# frozen_string_literal: true
module Types
  class QueryType < Types::BaseObject
    field :current_user, UserType, null: true do
      description 'Retrieve my profile.'
    end

    def current_user
      User.find_by(id: context[:current_user])
    end

    field :restaurant, RestaurantType, null: true do
      argument :id, ID, required: true
      description 'Retrieve details about a particular restaurant.'
    end

    def restaurant(id:)
      Restaurant.find_by(id: id)
    end

    field :trending_restaurants, TrendingRestaurantType.connection_type, null: false do
      description 'Retrieve an ordered list of trending restaurants.'
    end

    def trending_restaurants
      TrendingRestaurant.all.includes(:restaurant).order(:index)
    end

    field :ottawa_favorites, OttawaFavoriteType.connection_type, null: false do
      description 'Retrieve an ordered list of Ottawa\'s current favorites.'
    end

    def ottawa_favorites
      OttawaFavorite.all.includes(:restaurant).order(:index)
    end

    field :recommendations, RecommendationType.connection_type, null: false do
      description 'Retrieve recommendations for the current user.'
    end

    def recommendations
      current_user.recommendations.order(:index)
    end
  end
end
