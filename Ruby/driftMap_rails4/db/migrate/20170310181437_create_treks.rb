class CreateTreks < ActiveRecord::Migration
  def change
    create_table :treks do |t|
      t.string :title
      t.text   :description
      t.string :coverphoto

      
      t.references :waypoint, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
