class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :code_bar, :description, :price_unit, :created_at, :updated_at
end
