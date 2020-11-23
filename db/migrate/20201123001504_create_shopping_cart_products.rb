class CreateShoppingCartProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_cart_products do |t|
      
      t.references :shopping_cart
      t.references :product
      t.integer :quantity

      t.timestamps
    end
  end
end
