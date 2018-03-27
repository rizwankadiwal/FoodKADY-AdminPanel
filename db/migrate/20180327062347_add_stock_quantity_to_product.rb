class AddStockQuantityToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :stock_quantity, :int
  end
end
