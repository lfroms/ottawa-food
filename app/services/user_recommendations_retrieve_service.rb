# frozen_string_literal: true
class UserRecommendationsRetrieveService < UseCaseService
  def execute(user_id:)
    @user = User.find_by(id: user_id)

    if @user.nil?
      Rails.logger.error("Could not calculate recommendations for user #{user_id}.")
      return
    end

    objects_list
  end

  private

  attr :user

  def scored_restaurants
    recommendation_map = Hash.new(0)

    user_restaurants = @user.restaurants_for_recommendation
    user_restaurants_count = user_restaurants.count

    all_other_users.find_each do |other_user|
      other_user_restaurants = other_user.restaurants_for_recommendation
      common_restaurants = other_user_restaurants & user_restaurants
      similarity = common_restaurants.size.to_f / user_restaurants_count

      (other_user_restaurants - common_restaurants).each do |restaurant|
        recommendation_map[restaurant] += similarity
      end
    end

    recommendation_map
  end

  def sorted_restaurants
    scored_restaurants.sort_by do |_restaurant_id, score|
      score
    end.reverse
  end

  def objects_list
    sorted_restaurants.map.with_index(1) do |pair, index|
      restaurant, score = pair

      {
        restaurant: restaurant,
        index: index,
        score: score.round(2),
      }
    end
  end

  def all_other_users
    users_including_favorites.all.where.not(id: @user_id)
  end

  def users_including_favorites
    User.includes(:favorite_restaurants).includes(:bucket_list_restaurants)
  end
end
