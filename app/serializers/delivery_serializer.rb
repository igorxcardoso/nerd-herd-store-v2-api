class DeliverySerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash


  attributes :id, :price_delivery, :cep, :address, :created_at, :updated_at
end
