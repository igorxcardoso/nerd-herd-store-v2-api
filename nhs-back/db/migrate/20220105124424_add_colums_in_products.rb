class AddColumsInProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :description, :string
    add_column :products, :price_unit, :float
  end
end
