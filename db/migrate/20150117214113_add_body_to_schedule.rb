class AddBodyToSchedule < ActiveRecord::Migration
  def change
  	add_column :schedules, :body, :string
  end
end
