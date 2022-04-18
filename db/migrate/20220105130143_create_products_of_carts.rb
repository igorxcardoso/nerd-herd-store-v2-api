class CreateProductsOfCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :products_of_carts do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :length_product
      t.float :price_for_product
      t.float :off_for_product

      t.timestamps
    end
  end
end
