# frozen_string_literal: true
class RestaurantFavoriteToggleService < UseCaseService
  def execute(user_id:, restaurant_id:)
    favorite = Favorite.find_by(user_id: user_id, restaurant_id: restaurant_id)

    if favorite.present?
      favorite.destroy
    else
      Favorite.create(user_id: user_id, restaurant_id: restaurant_id)
    end
  end
end
