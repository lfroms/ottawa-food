# frozen_string_literal: true
class OttawaFavoritesCalculateService < UseCaseService
  def execute(_)
    OttawaFavorite.delete_all
    OttawaFavorite.create(objects_list)
  end

  private

  def favorites_map
    favorites_map = {}

    users_to_process.find_each do |user|
      items = relevant_restaurants_for_user(user)

      items.each do |item|
        restaurant_id = item.restaurant.id

        if favorites_map.key?(restaurant_id)
          favorites_map[restaurant_id] += 1
        else
          favorites_map[restaurant_id] = 1
        end
      end
    end

    favorites_map.each do |restaurant_id, count|
      favorites_map[restaurant_id] = count * 4 # Yelp Rating
    end

    favorites_map
  end

  def sorted_favorites
    favorites_map.to_a.sort_by(&:count)
  end

  def objects_list
    sorted_favorites.map.with_index(1) do |pair, index|
      restaurant_id, _count = pair

      { restaurant_id: restaurant_id, index: index }
    end
  end

  def relevant_restaurants_for_user(user)
    (user.favorites.includes(:restaurant) + user.bucket_list_items.pending.includes(:restaurant))
  end

  def users_to_process
    User.all
  end
end
