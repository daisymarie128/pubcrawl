class CreateAchievments < ActiveRecord::Migration
  def change
    create_table :achievments do |t|
      t.integer :user_id
      t.integer :pub_challenge_id
    end
  end
end
