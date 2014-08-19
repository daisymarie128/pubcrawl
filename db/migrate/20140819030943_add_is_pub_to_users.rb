class AddIsPubToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_pub, :boolean, default: false
  end
end
