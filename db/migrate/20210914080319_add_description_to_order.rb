class AddDescriptionToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :description, :string
  end
end
