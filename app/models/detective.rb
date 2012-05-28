class Detective < Player

  def won?
    caught_jack? || game.ended?
  end

  def caught_jack?
    #TODO
    false
  end

  def accuse character
    character.is_jack? ? win! : jack.win!
  end

  def win!
  end

  def jack
    game.jack
  end
end
