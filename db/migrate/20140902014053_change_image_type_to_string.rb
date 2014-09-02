class ChangeImageTypeToString < ActiveRecord::Migration
  def change
    remove_column :pubs, :image
    add_column :pubs, :image, :string
  end
end
