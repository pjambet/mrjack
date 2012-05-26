class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.timestamps
    end
    add_index :players, [:user_id, :game_id]
  end
end
