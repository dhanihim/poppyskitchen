class AddKeyToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :key, :string
  end
end
