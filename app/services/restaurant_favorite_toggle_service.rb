# frozen_string_literal: true
class RestaurantFavoriteToggleService < UseCaseService
  def execute(user_id:, yelp_id:)
    restaurant = Restaurant.find_by(yelp_id: yelp_id)
    favorite = Favorite.find_by(user_id: user_id, restaurant: restaurant)

    if favorite.present?
      favorite.destroy
    else
      Favorite.create(user_id: user_id, restaurant: restaurant)
    end
  end
end
