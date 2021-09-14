class AddScheduleIdToScheduledProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :scheduled_products, :schedule_id, :integer
    add_index :scheduled_products, :schedule_id
  end
end
