class AddCompletedToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :completed, :boolean
  end
end
