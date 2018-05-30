class AddDescriptionToWaypointImages < ActiveRecord::Migration
  def change
    add_column :waypoint_images, :description, :text
  end
end
