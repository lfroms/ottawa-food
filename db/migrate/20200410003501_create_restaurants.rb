class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :yelp_id, null: false

      t.timestamps null: false
    end
  end
end
