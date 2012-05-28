class Game < ActiveRecord::Base
  has_one :jack
  has_one :detective
  has_one :board

  has_many :character_games, foreign_key: :game_id
  has_many :characters, through: :character_games

  TURN = 8

  ODD_TURN = [:detective, :jack, :jack, :detective]
  EVEN_TURN = [:jack, :detective, :detective, :jack]

  validates :jack, :detective, presence: true
  Characer.characters.each { |char| validates char, presence: true }
  validates :board, presence: true

  def available_character_cards_stack
    []
  end

  def visible_character_cards
    []
  end

  def played_character_cards_stack
    []
  end

  def which_player
    (even_turn? ? EVEN_TURN[draw_turn] : ODD_TURN[draw_turn])
  end

  def init jack
    board.init
    set_jack jack
  end

  def set_jack character
    character.is_jack
  end

  def start_game!
    init
  end

  def end_game!
  end

  def next_turn
    current_turn = current_turn + 1
    new_turn
  end

  def draw_four_cards
    if available_character_cards_stack.empty?
      available_character_cards_stack = played_character_cards_stack.shuffle
      played_character_cards_stack, visible_character_cards = [], []
    end
    available_character_cards_stack.slice!(0..3)
  end

  def new_turn
    characters = characters.shuffle if odd_turn?
    draw_four_cards
    4.times do |i|
      played_card = visible_character_cards.delete self.send(which_player).play
      played_character_cards_stack << played_card
      draw_turn = draw_turn + 1
    end
  end

  def end_turn
  end

  def call_for_witnesses

  end

  def shut_gaslight_off
    board.gaslights[current_turn / 2].shut if even_turn?
  end

  def witnesses?
    characters.any?{ |c| c.visible? }
  end

  protected
  def shuffle_cards
  end

  def even_turn?
    current_turn % 2 == 0
  end

  def odd_turn?
    current_turn % 2 != 0
  end
end
