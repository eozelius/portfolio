class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :title
      t.text   :body
      t.string :coverphoto
      t.float  :x
      t.float  :y

      t.references :waypoint, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
