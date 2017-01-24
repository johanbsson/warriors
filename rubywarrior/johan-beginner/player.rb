class Player
  def initialize
    @healt_last_turn = 0
  end
  def play_turn(warrior)
    
    if must_step_back? warrior
      warrior.walk! :backward
    elsif can_walk_forward? warrior 
      warrior.walk!
    elsif must_rest? warrior
      warrior.rest!
    else
      warrior.attack!
    end
    @healt_last_turn = warrior.health
  end
  def must_step_back?(warrior)
    (! warrior.feel.empty?) && (feeling_sick? warrior)
  end
  def can_walk_forward?(warrior)
    feel_god_and_next_space_is_empty =  warrior.feel.empty? && feeling_good?(warrior)
    under_attack = health_diminished? warrior
    under_attack || feel_god_and_next_space_is_empty
  end
  def healt_diminished?(warrior)
    warrior.health < @healt_last_turn
  end
  def feeling_good?(warrior)
    min_health = 10
    warrior.health > min_health
  end
  def feeling_sick?(warrior)
    ! feeling_good?(warrior) 
  end
  def must_rest?(warrior)
    feeling_sick? warrior 
  end
end

#  warrior.health
#  warrior.rest!
#  warrior.feel
#  warrior.attack!
#  warrior.walk!
=begin
class Player
  def play_turn(warrior)
    if @needCure == nil
      if warrior.health < 18
        warrior.walk! :backward
        @needCure = true
      else
        if warrior.feel.empty?
          warrior.walk!
        else
          warrior.attack!
        end
      end
    else
      warrior.rest!
      @needCure = nil
    end
  end
end
=end
