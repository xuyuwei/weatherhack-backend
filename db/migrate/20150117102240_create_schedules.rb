class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :place_id

      t.timestamps null: false
    end
  end
end
