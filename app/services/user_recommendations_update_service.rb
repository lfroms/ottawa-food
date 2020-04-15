# frozen_string_literal: true
class UserRecommendationsUpdateService < UseCaseService
  attr :user

  def execute(user_id:)
    @user = users_including_favorites.find_by(id: user_id)

    if @user.nil?
      Rails.logger.error("Could not calculate recommendations for user #{user_id}.")
      return
    end

    sorted_restaurants
  end

  private

  def scored_restaurants
    recommendation_map = Hash.new(0)

    target_user_favorites = @user.favorite_restaurants
    target_user_favorites_count = target_user_favorites.count

    all_other_users.find_each do |user|
      common_restaurants = user.favorite_restaurants & target_user_favorites
      similarity = common_restaurants.size.to_f / target_user_favorites_count

      (target_user_favorites - common_restaurants).each do |restaurant|
        recommendation_map[restaurant] += similarity
      end
    end

    recommendation_map
  end

  def sorted_restaurants
    scored_restaurants.sort_by do |_restaurant, score|
      score
    end.reverse
  end

  def all_other_users
    users_including_favorites.all.where.not(id: @user_id)
  end

  def users_including_favorites
    User.includes(:favorite_restaurants)
  end
end
