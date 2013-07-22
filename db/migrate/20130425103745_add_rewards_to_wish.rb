class AddRewardsToWish < ActiveRecord::Migration
  def change
    add_column :wishes, :rewards, :integer
  end
end
