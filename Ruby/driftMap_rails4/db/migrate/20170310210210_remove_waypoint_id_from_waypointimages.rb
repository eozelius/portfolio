class RemoveWaypointIdFromWaypointimages < ActiveRecord::Migration
  def change
    remove_column :waypoint_images, :waypoint_id
  end
end
