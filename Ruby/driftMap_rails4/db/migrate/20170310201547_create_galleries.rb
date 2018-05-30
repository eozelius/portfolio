class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.text   :description
      t.string :coverphoto
      t.float  :x
      t.float  :y

      t.references :waypoint, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
