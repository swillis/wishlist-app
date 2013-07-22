class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :title
      t.string :status
      t.datetime :close_date
      t.references :user

      t.timestamps
    end
    add_index :wishes, :user_id
  end
end
