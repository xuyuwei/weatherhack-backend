class AddLatLngToPlaces < ActiveRecord::Migration
  def change
  	add_column :places, :lat, :decimal
  	add_column :places, :lng, :decimal
  	add_column :places, :rating, :float
  	add_column :places, :icon_url, :string
  	add_column :places, :address, :string
  end
end
