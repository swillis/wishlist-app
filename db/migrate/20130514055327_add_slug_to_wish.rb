class AddSlugToWish < ActiveRecord::Migration
  def change
    add_column :wishes, :slug, :string
    add_index :wishes, :slug
    Wish.find_each(&:save)
  end
end
