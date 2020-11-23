class ShoppingCartProduct < ApplicationRecord
    belongs_to :product
    belongs_to :shopping_cart

    validates :shopping_cart, presence: true
    validates :product, presence: true

    after_save :calculate_total

    def calculate_total
        total = self.product.price * self.quantity
        self.shopping_cart.update(total: self.shopping_cart.total += total)
    end

end
