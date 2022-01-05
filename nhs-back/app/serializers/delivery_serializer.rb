class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :price_delivery, :cep, :address, :created_at, :updated_at
end
