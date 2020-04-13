# frozen_string_literal: true
class RestaurantYelpSyncService < UseCaseService
  def execute(yelp_id:)
    restaurant = Restaurant.find_by(yelp_id: yelp_id)

    return if restaurant.blank?

    response = Yelp::Business.get(yelp_id: yelp_id)

    if response.data.nil?
      Rails.logger.error("Unable to fetch data for business with id: #{yelp_id}")
      return
    end

    business = response.data.business

    return if business.blank?

    params = {
      name: business.name,
      image_url: business.photos.first,
      yelp_url: business.url,
      phone: business.phone,
      yelp_rating: business.rating,
      price_level: business.price,
    }

    restaurant.update(params)
  end
end
