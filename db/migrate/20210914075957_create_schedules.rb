class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.date :dateopen
      t.date :dateclose

      t.timestamps
    end
  end
end
