class Product < ApplicationRecord
  has_many :contents, dependent: :destroy
  has_many :stocks, dependent: :destroy

  validates :title, presence: true      # title is mandatory
end
