class StockSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :avaliable, :reserved, :created_at, :updated_at
end
