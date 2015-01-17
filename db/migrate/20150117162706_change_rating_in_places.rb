class ChangeRatingInPlaces < ActiveRecord::Migration
   def up
    change_column :places, :rating, :float
  end

  def down
    change_column :places, :rating, :integer
  end
end
