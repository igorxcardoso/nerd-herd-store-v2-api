class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :url, :media_type, :created_at, :updated_at
end
