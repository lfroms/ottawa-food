# frozen_string_literal: true
module Types
  class QueryType < Types::BaseObject
    description 'The queries that can be performed.'

    field :current_user,
      resolver: Resolvers::CurrentUser,
      description: 'Specific details about the current user.'

    field :trending_restaurants,
      resolver: Resolvers::TrendingRestaurants,
      description: 'Ordered list of currently trending restaurants.'

    field :search,
      resolver: Resolvers::Search,
      description: 'Search for restaurants.'

    field :ottawa_favorites,
      resolver: Resolvers::OttawaFavorites,
      description: "Ordered list of Ottawa's top favorite restaurants."
  end
end
