class ProductSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash


  attributes :id, :title, :code_bar, :description, :price_unit, :created_at, :updated_at
end
