class RemoveCurrentCostFromScheduledProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :scheduled_products, :current_price
    remove_column :scheduled_products, :current_cost
  end
end
