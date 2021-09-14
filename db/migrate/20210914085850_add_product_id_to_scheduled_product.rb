class AddProductIdToScheduledProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :scheduled_products, :product_id, :integer
    add_index :scheduled_products, :product_id
  end
end
