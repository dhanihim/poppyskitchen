class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :link
      t.integer :cost
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
