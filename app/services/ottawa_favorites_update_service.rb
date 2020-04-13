# frozen_string_literal: true
class OttawaFavoritesUpdateService < UseCaseService
  def execute(_)
    OttawaFavorite.delete_all
    OttawaFavorite.insert_all(objects_list)
  end

  private

  def users_to_process
    User.all.includes(:favorite_restaurants).includes(:bucket_list_restaurants)
  end

  def relevant_restaurants_for_user(user)
    (user.favorite_restaurants + user.bucket_list_restaurants).uniq
  end

  def scored_restaurants
    score_map = Hash.new(0)
    yelp_ratings = {}

    users_to_process.find_each do |user|
      items = relevant_restaurants_for_user(user)

      items.each do |item|
        score_map[item.id] += 1
        yelp_ratings[item.id] = item.yelp_rating
      end
    end

    score_map.each do |restaurant_id, count|
      score_map[restaurant_id] = count * (yelp_ratings[restaurant_id] || 0)
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
