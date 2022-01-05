class ProductsOfCartSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :length_product, :price_for_product,
              :off_for_product, :created_at, :updated_at
end