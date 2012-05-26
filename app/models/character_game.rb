class CharacterGame < ActiveRecord::Base
  belongs_to :character
  belongs_to :game
  attr_accessible :game_id, :character_id
end
