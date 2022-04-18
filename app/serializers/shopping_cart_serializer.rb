class ShoppingCartSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash


  attributes :id, :total_price, :created_at, :updated_at
end
