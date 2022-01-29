class ProductSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash


  attributes :id, :product_id, :url, :media_type, :created_at, :updated_at
end
