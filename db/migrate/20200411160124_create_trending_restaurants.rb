class CreateTrendingRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :trending_restaurants do |t|
      t.integer :index
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
