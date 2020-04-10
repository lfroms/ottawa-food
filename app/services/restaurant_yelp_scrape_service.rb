# frozen_string_literal: true
class RestaurantYelpScrapeService < UseCaseService
  def execute(yelp_id:)
    @yelp_id = yelp_id
    # restaurant = Restaurant.find_by(yelp_id: yelp_id)
    # html = parsed_html(yelp_id)

    Rails.logger.info("Scraped Yelp for #{yelp_id}")
  end

  private

  attr :yelp_id

  BASE_YELP_URL = 'https://www.yelp.ca/biz/'

  def parsed_html
    Nokogiri::HTML(raw_html(@yelp_id))
  end

  def raw_html
    uri = URI.parse("#{BASE_YELP_URL}#{@yelp_id}")

    HTTP.get(uri).to_s
  end
end
