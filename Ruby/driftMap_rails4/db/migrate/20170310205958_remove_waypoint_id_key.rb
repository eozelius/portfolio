class RemoveWaypointIdKey < ActiveRecord::Migration
  def change
    remove_foreign_key :waypoint_images, column: :waypoint_id
  end
end
