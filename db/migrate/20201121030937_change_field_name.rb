class ChangeFieldName < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :praice, :price
  end
end
