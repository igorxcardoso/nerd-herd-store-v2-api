class ShoppingCartSerializer < ActiveModel::Serializer
  attributes :id, :delivery_id, :total_price, :created_at, :updated_at
end
