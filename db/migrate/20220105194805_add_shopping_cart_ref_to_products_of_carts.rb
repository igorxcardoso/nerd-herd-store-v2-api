class AddShoppingCartRefToProductsOfCarts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products_of_carts, :shopping_cart, null: false, foreign_key: true
  end
end
