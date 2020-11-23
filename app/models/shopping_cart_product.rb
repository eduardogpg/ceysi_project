class ShoppingCartProduct < ApplicationRecord
    belongs_to :product
    belongs_to :shopping_cart

    validates :shopping_cart, presence: true
    validates :product, presence: true

end
