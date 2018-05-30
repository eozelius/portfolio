class CreateWaypointImages < ActiveRecord::Migration
  def change
    create_table :waypoint_images do |t|
      t.string :image
      t.references :waypoint, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end