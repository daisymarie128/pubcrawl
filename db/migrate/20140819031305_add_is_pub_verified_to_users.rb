class AddIsPubVerifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_pub_verified, :boolean, default: false
  end
end
