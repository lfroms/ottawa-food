# frozen_string_literal: true
module Resolvers
  class Search < Resolvers::Base
    type [Types::YelpSearchResultType], null: false

    argument :query, String, required: true

    def resolve(query:)
      data = Yelp::Search.perform(query: query).data

      return [] if data.nil?

      search = data.search

      return [] if search.nil?

      search.business.map do |business|
        {
          yelp_id: business.id,
          name: business.name,
          address: business.location.address1,
        }
      end
    end
  end
end
