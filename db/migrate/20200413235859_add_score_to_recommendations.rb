class AddScoreToRecommendations < ActiveRecord::Migration[6.0]
  def change
    add_column :recommendations, :score, :float, null: false
  end
end
