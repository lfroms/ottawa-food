# frozen_string_literal: true
class RestaurantFavoriteToggleService < UseCaseService
  def execute(user_id:, restaurant_id:)
    restaurant = Restaurant.find_by(id: restaurant_id)
    user = User.find(user_id)

    return if restaurant.blank?

    favorite = Favorite.find_by(user: user, restaurant: restaurant)

    if favorite.present?
      favorite.destroy
    else
      Favorite.create(user: user, restaurant: restaurant)
    end
  end
end
