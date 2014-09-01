class AddUsernameToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :username, :string
  end
end
