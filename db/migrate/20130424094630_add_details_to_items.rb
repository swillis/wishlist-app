class AddDetailsToItems < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :price, :float
  end
end
