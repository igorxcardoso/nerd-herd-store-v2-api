class ShoppingCart < ApplicationRecord
  belongs_to :delivery, dependent: :destroy
end
