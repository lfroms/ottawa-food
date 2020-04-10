require 'graphql/client/http'

module Yelp
  HTTP = GraphQL::Client::HTTP.new('https://api.yelp.com/v3/graphql') do
    def headers(context)
      yelp_key = ENV['YELP_KEY']
      bearer = "Bearer #{yelp_key}"

      { 'Authorization': bearer }
    end
  end

  Schema = GraphQL::Client.load_schema(HTTP)

  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
end