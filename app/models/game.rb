class Game < ActiveRecord::Base
  has_one :jack
  has_one :detective

  has_many :character_games, foreign_key: :game_id
  has_many :characters, through: :character_games

  TURN = 8

  ODD_TURN = [:detective, :jack, :jack, :detective]
  EVEN_TURN = [:jack, :detective, :detective, :jack]

  def which_player
    (current_turn % 2 == 0 ? EVEN_TURN[draw_turn] : ODD_TURN[draw_turn]).constantize
  end

  def board
    @board ||= Board.new
  end

  def start
  end

  def end
  end

  def new_turn
  end

  def end_turn
  end

  def call_for_witnesses
  end

  def shut_gaslight_off
  end

end
