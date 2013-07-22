class AddCurrencyToItem < ActiveRecord::Migration
  def change
    add_column :items, :currency_type, :string
  end
end
