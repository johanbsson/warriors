class Player
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
end
