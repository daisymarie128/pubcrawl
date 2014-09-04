class SetDefaultOnRegComplete < ActiveRecord::Migration
  def change
    remove_column :users, :registration_complete
    add_column :users, :registration_complete, :boolean, :default => false
  end
end
