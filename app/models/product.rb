class Product < ApplicationRecord

    after_update :validate_stock

    def validate_stock
        if self.stock <= 5
            
        end
    end
    
    def is_valid_to_add?
        self.stock >= 5
    end
end
