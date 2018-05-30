class CreateDriftmaps < ActiveRecord::Migration
  def change
    create_table :driftmaps do |t|
      t.string :title
      t.text :body
      t.float :init_x
      t.float :init_y
      t.integer :init_zoom
      t.integer :user_id, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end