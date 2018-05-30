class AddLatLngToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :x, :float
    add_column :journeys, :y, :float


    # add_column :driftmaps, :color_scheme, :string,  default: 'myDefault'
  end
end
