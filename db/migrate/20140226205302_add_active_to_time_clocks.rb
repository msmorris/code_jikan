class AddActiveToTimeClocks < ActiveRecord::Migration
  def change
    add_column :time_clocks, :active, :boolean
  end
end
