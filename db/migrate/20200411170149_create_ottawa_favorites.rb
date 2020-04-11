class CreateOttawaFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :ottawa_favorites do |t|
      t.integer :index
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
