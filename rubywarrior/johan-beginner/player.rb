class Player
  def initialize
    @healt_last_turn = 0
  end
  def play_turn(warrior)
    if should_walk? warrior 
      warrior.walk!
    else
      warrior.attack!
    end
  end
  def should_walk?(warrior)
    return warrior.feel.empty?
  end
  def i_am_healty?(warrior)
    min_health = 10
    return warrior.health > min_health
  end
  def must_rest?(warrior)
    return jada
  end
end
