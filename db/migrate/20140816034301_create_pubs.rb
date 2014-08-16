class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.string :name
      t.string :address
      t.text :image
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end