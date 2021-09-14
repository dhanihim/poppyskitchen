class AddOrderIdToOrderedProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :ordered_products, :order_id, :integer
    add_index :ordered_products, :order_id
  end
end
