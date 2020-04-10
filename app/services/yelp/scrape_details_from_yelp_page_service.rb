# frozen_string_literal: true
module Yelp
  class ScrapeDetailsFromYelpPageService < UseCaseService
    BASE_YELP_URL = 'https://www.yelp.ca/biz/'

    def execute(yelp_id:)
      # restaurant = Restaurant.find_by(yelp_id: yelp_id)
      # html = parsed_html(yelp_id)

      Rails.logger.info("Scraped Yelp for #{yelp_id}")
    end

    private

    def parsed_html(yelp_id)
      Nokogiri::HTML(raw_html(yelp_id))
    end

    def raw_html(yelp_id)
      uri = URI.parse("#{BASE_YELP_URL}#{yelp_id}")

      HTTP.get(uri).to_s
    end
  end
end
