class CreateHexes < ActiveRecord::Migration
  def change
    create_table :hexes do |t|
      t.string :name
      t.integer :x, :y
      t.timestamps
    end
  end
end
