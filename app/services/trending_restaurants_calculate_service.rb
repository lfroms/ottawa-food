# frozen_string_literal: true
class TrendingRestaurantsCalculateService < UseCaseService
  def execute(_)
    TrendingRestaurant.delete_all
    TrendingRestaurant.create(objects_list)
  end

  private

  def last_250_favorited_or_listed
    favorites = Favorite.includes(:restaurant).last(250)
    bucket_list_items = BucketListItem.includes(:restaurant).last(250)

    (favorites + bucket_list_items).sort_by(&:created_at).take(250)
  end

  def favorites_map
    favorites_map = {}

    last_250_favorited_or_listed.each do |item|
      restaurant_id = item.restaurant.id

      if favorites_map.key?(restaurant_id)
        favorites_map[restaurant_id] += 1
      else
        favorites_map[restaurant_id] = 1
      end
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
end
