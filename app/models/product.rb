class Product < ApplicationRecord

    after_update :validate_stock

    def validate_stock
       
    end
    
    def is_valid_to_add?
        true
    end
end
