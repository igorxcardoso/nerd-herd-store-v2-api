class ShoppingCartSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :created_at, :updated_at
end
