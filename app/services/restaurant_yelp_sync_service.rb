# frozen_string_literal: true
class RestaurantYelpSyncService < UseCaseService
  def execute(yelp_id:)
    restaurant = Restaurant.find_by(yelp_id: yelp_id)

    return if restaurant.blank?

    business = Yelp::Business.get(yelp_id: yelp_id).data.business
    restaurant.update(name: business.name, image_url: business.photos.first)
  end
end
