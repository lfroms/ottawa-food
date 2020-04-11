# frozen_string_literal: true
class RestaurantYelpSyncService < UseCaseService
  def execute(yelp_id:)
    restaurant = Restaurant.find_by(yelp_id: yelp_id)

    return if restaurant.blank?

    business = Yelp::Business.get(yelp_id: yelp_id).data.business

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
