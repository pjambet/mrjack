class Board
  has_many :hexes
  belongs_to :game

  def init
    init_players
    init_hexes
  end

  def []
  end

  def init_players
  end

  def init_hexes
  end
end
