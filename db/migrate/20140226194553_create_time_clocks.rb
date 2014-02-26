class CreateTimeClocks < ActiveRecord::Migration
  def change
    create_table :time_clocks do |t|
      t.datetime :started
      t.datetime :ended
      t.references :user, index: true

      t.timestamps
    end
  end
end
