class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.text :avatar
      t.string :location
      t.string :score
      t.timestamps
    end
  end
end
