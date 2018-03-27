class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :sku
      t.boolean :is_available
      t.boolean :taxable_class
      t.text :description
      t.decimal :price
      t.decimal :cost
      t.text :notes

      t.timestamps
    end
  end
end
