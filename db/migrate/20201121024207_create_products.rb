class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.integer :stock
      t.decimal :praice

      t.timestamps
    end
  end
end
