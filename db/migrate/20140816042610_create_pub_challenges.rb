class CreatePubChallenges < ActiveRecord::Migration
  def change
    create_table :pub_challenges do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :badge
      t.integer :pub_id
      t.timestamps
    end
  end
end
