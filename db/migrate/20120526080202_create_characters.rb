class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.integer :available_movements
      t.boolean :is_jack
      t.belongs_to :hex
      t.timestamps
    end
  end
end
