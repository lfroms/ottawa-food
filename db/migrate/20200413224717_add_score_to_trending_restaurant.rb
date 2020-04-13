class AddScoreToTrendingRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :trending_restaurants, :score, :float, null: false
  end
end
