class Character < ActiveRecord::Base
  include Ability

  has_one :character_game
  has_one :game, through: :character_game

  belongs_to :hex

  validates :xn :y, numericality: true # and also >= 0

  delegate :board, to: :game

  def self.characters
    [ :bert, :goodley, :gull, :holmes, :lestrade, :smith, :stealthy, :watson ]
  end

  def initial_position
    [initial_x, initial_y]
  end

  def move x,y
    update_attributes! x: x, y: y
  end

  def initial_x
  end

  def initial_y
  end

  def visible?
    adjacent_to? :light || adjacent_to? :character
  end

  def adjacent_to? type
    surrounding_hexes.any { |hex| hex.covered_by? type }
  end

  def surrounding_hexes
    hex.surrounding_hexes
  end

end
