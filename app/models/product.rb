class Product < ApplicationRecord

    after_update :validate_stock

    def validate_stock
       ProductMailer.stock(User.first, self).deliver if self.stock <= 5
    end
    
    def is_valid_to_add?
        self.stock >= 5
    end
end
