class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
    	t.string :hour
	    t.string :condition
	    t.string :condition_url
	    t.string :city
    end
  end
end
