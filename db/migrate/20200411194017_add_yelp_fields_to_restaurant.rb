class AddYelpFieldsToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :yelp_url, :string, null: true
    add_column :restaurants, :phone, :string, null: true
    add_column :restaurants, :yelp_rating, :float, null: true
    add_column :restaurants, :price_level, :string, null: true
  end
end
