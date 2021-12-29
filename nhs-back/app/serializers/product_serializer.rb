class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :code_bar, :created_at, :updated_at
end
