class AddRegFieldsToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :sign_in_token, :string
    add_column :pubs, :password_reset, :string
    add_column :pubs, :registration_complete, :boolean, :default => false
  end
end
