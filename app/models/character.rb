class Character < ActiveRecord::Base
  include Ability

  has_one :character_game
  has_one :game, through: :character_game

  def move
    #TODO
  end

end
