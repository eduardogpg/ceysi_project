class AddStatusToShoppingCart < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_carts, :status, :string, default:'IN_PROGRESS'
  end
end
