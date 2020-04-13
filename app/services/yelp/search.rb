# frozen_string_literal: true
module Yelp
  class Search
    Query = Yelp::Client.parse(<<-'GRAPHQL')
      query($term: String!, $location: String!, $limit: Int!) {
        search(term: $term, location: $location, limit: $limit) {
          total
          business {
            id
            name
            location {
              address1
            }
          }
        }
      }
    GRAPHQL

    def self.perform(query:)
      Client.query(Query, variables: { term: query, location: 'Ottawa, Ontario, Canada', limit: 5 })
    end
  end
end
