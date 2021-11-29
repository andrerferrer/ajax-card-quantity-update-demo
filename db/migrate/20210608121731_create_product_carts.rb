class CreateProductCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :product_carts do |t|
      t.references :shopping_cart, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
