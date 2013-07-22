class AddDetailsToWish < ActiveRecord::Migration
  def change
    add_column :wishes, :goal, :text
    add_column :wishes, :description, :text
    add_column :wishes, :completion_date, :date
    add_column :wishes, :public_url, :string
  end
end
