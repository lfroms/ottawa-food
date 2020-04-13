# frozen_string_literal: true
class UserRecommendationsUpdateService < UseCaseService
  def execute(user_id:)
    user = User.includes(:favorite_restaurants).includes(:bucket_list_restaurants).find_by(id: user_id)

    if user.nil?
      Rails.logger.error("Could not calculate recommendations for user #{user_id}.")
      return
    end

    @user_id = user_id

    recommendation_map = Hash.new(0)

    user_restaurants = restaurants_for_user(user)

    subsets = user_restaurants.combination(2)

    subsets.each do |subset|
      probability_map = recommendation_based_on_subset(subset)

      probability_map.each do |id, score|
        recommendation_map[id] += score
      end
    end

    sorted = recommendation_map.sort_by do |_id, score|
      score
    end.to_h

    recommendations = sorted.values - user_restaurants

    user.recommendations.delete_all
    user.recommendations.create([{ restaurant: Restaurant.first, index: 0 }])
  end

  private

  attr :user_id

  def recommendation_based_on_subset(subset)
    probability_map = Hash.new(0)
    count_of_identical_subsets = 0

    all_other_users = User.where.not(id: @user_id).includes(:favorite_restaurants).includes(:bucket_list_restaurants)

    all_other_users.find_each do |user|
      user_restaurants = restaurants_for_user(user)

      if (subset - user_restaurants).empty?
        count_of_identical_subsets += 1
        probability_map[1] += 1
      end
    end

    probability_map.update(probability_map) do |_id, score|
      score / count_of_identical_subsets
    end

    probability_map
  end

  def restaurants_for_user(user)
    (user.favorite_restaurants + user.bucket_list_restaurants).uniq
  end
end
