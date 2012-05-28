class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def won?
  end

  def win!
    game.end_game!
  end

  def play
    pick_a_card
  end

  def pick_a_card card

  end
end
