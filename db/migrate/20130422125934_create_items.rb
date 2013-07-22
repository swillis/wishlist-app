class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :detail
      t.references :wish

      t.timestamps
    end
  end
end
