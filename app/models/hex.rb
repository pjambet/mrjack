class Hex < ActiveRecord::Base
  belongs_to :board

  validates :board, presence: true

  Y_OFFSET = [2, 1, 1, 2, 0, 0, 0, 1, 1, 2, 1, 1, 1]

  attr_accessible :x, :y

  def y
    super + Y_OFFSET[x]
  end

  def north
    self.board[x, y - 1]
  end

  def south
    board[x, y + 1]
  end

  def north_east
    board[x + 1][actual_y(:north)]
  end

  def north_west
    board[x - 1][actual_y(:north)]
  end

  def south_west
    board[x - 1][actual_y(:south)]
  end

  def south_east
    board[x + 1][actual_y(:south)]
  end

  def surrounding_hexes
    [north, north_east, south_east, south, south_west, north_west]
  end

  protected
  def actual_y dir
    case dir
    when :north
      x % 2 == 0 ? y : y - 1
    when :south
      x % 2 == 0 ? y + 1 : y
    end
  end

end
