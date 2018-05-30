class AddColorschemeToDriftmaps < ActiveRecord::Migration
  def change
    add_column :driftmaps, :color_scheme, :string,  default: 'myDefault'
  end
end
