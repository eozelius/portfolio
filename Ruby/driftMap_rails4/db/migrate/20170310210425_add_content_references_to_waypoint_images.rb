class AddContentReferencesToWaypointImages < ActiveRecord::Migration
  def change
    add_column :waypoint_images, :friend_id,  :integer
    add_column :waypoint_images, :essay_id,   :integer
    add_column :waypoint_images, :trek_id,    :integer
    add_column :waypoint_images, :gallery_id, :integer

    add_reference :waypoint_images, :friends,   foreign_key: true
    add_reference :waypoint_images, :galleries, foreign_key: true
    add_reference :waypoint_images, :essays,    foreign_key: true
    add_reference :waypoint_images, :treks,     foreign_key: true
  end
end
