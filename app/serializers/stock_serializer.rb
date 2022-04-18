class StockSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash


  attributes :id, :product_id, :avaliable, :reserved, :created_at, :updated_at
end
