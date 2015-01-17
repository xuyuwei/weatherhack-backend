class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :place_id
      t.string :city
      t.string :tags

      t.timestamps null: false
    end
  end
end
