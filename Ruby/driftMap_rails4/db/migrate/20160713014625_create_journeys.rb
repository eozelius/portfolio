class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.text :description
      t.string :title
      t.string :coverphoto

      t.references :driftmap, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
