class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.references :delivery, null: false, foreign_key: true
      t.float :total_price

      t.timestamps
    end
  end
end
