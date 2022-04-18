class ProductsOfCartSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash


  attributes :id, :product_id, :length_product, :shopping_cart_id, :price_for_product,
              :off_for_product, :created_at, :updated_at
end