class AddStuffToSchedule < ActiveRecord::Migration
  def change
  	add_column :schedules, :day, :string
  	add_column :schedules, :start_time, :string
  	add_column :schedules, :end_time, :string
end
end
