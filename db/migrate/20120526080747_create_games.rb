class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :current_turn, :draw_turn
      t.timestamps
    end
  end
end
