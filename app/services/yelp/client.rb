# frozen_string_literal: true
require 'graphql/client/http'

module Yelp
  class Client
    class << self
      def query(*args)
        YelpClient.query(*args)
      end

      def parse(*args)
        YelpClient.parse(*args)
      end

      private

      HTTP = GraphQL::Client::HTTP.new('https://api.yelp.com/v3/graphql') do
        def headers(_context)
          yelp_key = ENV['YELP_KEY']
          bearer = "Bearer #{yelp_key}"

          { 'Authorization': bearer }
        end
      end

      Schema = GraphQL::Client.load_schema(HTTP)
      YelpClient = GraphQL::Client.new(schema: Schema, execute: HTTP)
    end
  end
end
