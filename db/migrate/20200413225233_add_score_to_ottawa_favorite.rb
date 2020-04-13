class AddScoreToOttawaFavorite < ActiveRecord::Migration[6.0]
  def change
    add_column :ottawa_favorites, :score, :float, null: false
  end
end
