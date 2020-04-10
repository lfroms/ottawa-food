module Mutations
  class ToggleFavoriteRestaurant < BaseMutation
    field :restaurant, Types::RestaurantType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      restaurant = Restaurant.find_by(id: id)
      user = User.find(context[:current_user])

      return unless restaurant.present?

      favorite = Favorite.find_by(user: user, restaurant: restaurant)

      if favorite.present?
        favorite.destroy
      else
        Favorite.create(user: user, restaurant: restaurant)
      end
    end
  end
end
