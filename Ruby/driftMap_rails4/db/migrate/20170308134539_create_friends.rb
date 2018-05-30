class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.text   :description
      t.float  :x
      t.float  :y
      t.boolean :member, default: false
      t.boolean :visible

      t.references :waypoint, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end