class AddFirstNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    
    add_column :users, :profile_image, :string
    add_column :users, :bio, :text
  end
end
