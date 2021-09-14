class AddVisitorIdToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :visitor_id, :integer
    add_index :orders, :visitor_id
  end
end
