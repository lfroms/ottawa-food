# frozen_string_literal: true
class TrendingRestaurantsCalculateService < UseCaseService
  def execute(_)
    TrendingRestaurant.delete_all
    TrendingRestaurant.insert_all(objects_list)
  end

  private

  def last_250_favorited_or_listed
    favorites = Favorite.includes(:restaurant).order(:created_at).last(250)
    bucket_list_items = BucketListItem.includes(:restaurant).pending.order(:created_at).last(250)

    (favorites + bucket_list_items).sort_by(&:created_at).take(250)
  end

  def scored_restaurants
    score_map = Hash.new(0)

    last_250_favorited_or_listed.each do |item|
      score_map[item.restaurant.id] += 1
    end

    score_map
  end

  def sorted_restaurants
    scored_restaurants.to_a.sort_by do |_key, value|
      value
    end
  end

  def objects_list
    sorted_restaurants.reverse.map.with_index(1) do |pair, index|
      restaurant_id, count = pair

      # https://github.com/rails/rails/issues/35493
      now = Time.zone.now

      { restaurant_id: restaurant_id, index: index, score: count, created_at: now, updated_at: now }
    end
  end
end
