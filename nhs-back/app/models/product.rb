class Product < ApplicationRecord
  has_many :contents, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :products_of_carts, dependent: :nullify  # Vai setar null quando o produto for excluido

  validates :title, presence: true      # title is mandatory
end
