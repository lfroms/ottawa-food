class AddAppleIdentityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :apple_identity, :string, null: true
  end
end
