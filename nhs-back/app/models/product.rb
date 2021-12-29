class Product < ApplicationRecord
  has_many :contents, dependent: :destroy

end
