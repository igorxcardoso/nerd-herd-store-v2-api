class ProductsOfCart < ApplicationRecord
  belongs_to :product

  # validates :length_product,
  # has_and_belongs_to_many
end
