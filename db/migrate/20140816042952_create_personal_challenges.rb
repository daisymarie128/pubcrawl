class CreatePersonalChallenges < ActiveRecord::Migration
  def change
    create_table :personal_challenges do |t|
      t.string :name
      t.string :address
      t.text :image
      t.text :description
      t.integer :user_id
      t.timestamp
    end
  end
end
