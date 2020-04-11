# frozen_string_literal: true
module Yelp
  class Business
    Query = Yelp::Client.parse(<<-'GRAPHQL')
      query($id: String!) {
        business(id: $id) {
          name
          photos
          url
          phone
          rating
          price
        }
      }
    GRAPHQL

    def self.get(yelp_id:)
      Client.query(Query, variables: { id: yelp_id })
    end
  end
end
