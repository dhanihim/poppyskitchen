class AddDatedeliveryToSchedule < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :datedelivery, :date
  end
end
