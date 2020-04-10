class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :yelp_id, null: false
      t.string :name, null: true
      t.string :image_url, null: true

      t.timestamps null: false
    end

    add_index :restaurants, [:yelp_id], unique: true
  end
end
