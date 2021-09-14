class AddScheduledProductIdToOrderedProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :ordered_products, :scheduled_product_id, :integer
    add_index :ordered_products, :scheduled_product_id
  end
end
