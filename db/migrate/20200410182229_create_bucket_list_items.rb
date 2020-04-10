class CreateBucketListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :bucket_list_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.column :status, :integer, default: 0

      t.timestamps
    end
  end
end
