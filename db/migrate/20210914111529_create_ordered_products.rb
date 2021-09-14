class CreateOrderedProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_products do |t|
      t.integer :price
      t.integer :profit
      t.integer :total
      t.string :description

      t.timestamps
    end
  end
end
