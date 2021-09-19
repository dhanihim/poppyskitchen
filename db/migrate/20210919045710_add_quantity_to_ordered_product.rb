class AddQuantityToOrderedProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :ordered_products, :quantity, :integer
  end
end
