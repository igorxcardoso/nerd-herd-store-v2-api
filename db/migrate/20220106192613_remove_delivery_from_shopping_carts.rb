class RemoveDeliveryFromShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :shopping_carts, :delivery, null: false, foreign_key: true
  end
end
