class CreateScheduledProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :scheduled_products do |t|
      t.integer :current_cost
      t.integer :current_price

      t.timestamps
    end
  end
end
