class AddTotalToShoppingCart < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_carts, :total, :decimal, default: 0
  end
end
