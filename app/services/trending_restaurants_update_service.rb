# frozen_string_literal: true
class TrendingRestaurantsUpdateService < UseCaseService
  def execute(_)
    TrendingRestaurant.delete_all
    TrendingRestaurant.insert_all(objects_list)
  end

  private

  def last_250_favorited_or_listed
    favorites = Favorite.includes(:restaurant)
    bucket_list_items = BucketListItem.includes(:restaurant).pending

    combined = get_250_newest(favorites) + get_250_newest(bucket_list_items)

    combined.uniq.sort_by(&:created_at).take(250)
  end

  def scored_restaurants
    last_250_favorited_or_listed.each_with_object(Hash.new(0)) do |item, scores|
      scores[item.restaurant.id] += 1
    end
  end

  def sorted_restaurants
    scored_restaurants.sort_by do |_item, score|
      score
    end.reverse
  end

  def objects_list
    sorted_restaurants.map.with_index(1) do |pair, index|
      restaurant_id, count = pair

      # https://github.com/rails/rails/issues/35493
      now = Time.zone.now

      { restaurant_id: restaurant_id, index: index, score: count, created_at: now, updated_at: now }
    end
  end

  def get_250_newest(relation)
    relation.order(created_at: :desc).limit(250)
  end
end
