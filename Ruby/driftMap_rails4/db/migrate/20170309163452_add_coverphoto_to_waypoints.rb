class AddCoverphotoToWaypoints < ActiveRecord::Migration
  def change
    add_column :waypoints, :coverphoto, :string
  end
end
