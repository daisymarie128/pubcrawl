class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.string :name
      t.string :address
      t.text :image
      t.text :description
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end