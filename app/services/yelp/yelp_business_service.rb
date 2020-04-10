module Yelp
  class YelpBusinessService < UseCaseService
    Query = Yelp::Client.parse <<-'GRAPHQL'
      query($id: String!) {
        business(id: $id) {
          name
          photos
        }
      }
    GRAPHQL

    def execute(yelp_id:)
      Yelp::Client.query(Query, variables: {id: yelp_id})
    end
  end
end