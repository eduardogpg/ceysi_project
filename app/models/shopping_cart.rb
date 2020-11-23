class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_product

  def completed!
    
    self.shopping_cart_product.each do |shopping_product|
      product = shopping_product.product
      product.stock = product.stock - shopping_product.quantity
      product.save
    end

    self.update(status:'COMPLETED')
  end

  def calculate_total
    self.total = 0
    self.shopping_cart_product.each { |s_p| self.total += s_p.product.price * s_p.quantity }

    self.save
  end

  def products
    total = 0
    self.shopping_cart_product.each { |s_p| total += s_p.quantity }
    
    total
  end
end
