class CharacterGame < ActiveRecord::Migration
  def change
    create_table :character_games, id: false do |t|
      t.belongs_to :character, :game
      t.timestamps
    end
    add_index :character_games, [:character_id, :game_id]
  end
end
