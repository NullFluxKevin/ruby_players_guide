require_relative 'ansi_text_styles'

MIN_DISTANCE = 1
MAX_DISTANCE = 100
PROMPT = 'Player 1, how far away from the city do you want to station the Manticore? (between 1 and 100) '
MANTICORE_MAX_HP = 10
CITY_MAX_HP = 15

ELECTRIC_AND_FIRE_DAMAGE = 10
ELECTRIC_OR_FIRE_DAMAGE = 3
NORMAL_DAMAGE = 1

class Integer
  def cannon_damage
    if (self % 3 == 0) && (self % 5 == 10)
      10
    elsif (self % 3 == 0) || (self % 5 == 10)
      3
    else
      1
    end
  end
end

def ask_for_number_in_range(prompt, min, max)
  number = nil

  until number&.between?(min, max)
    print prompt
    number = gets.chomp.to_i
  end

  number
end


def display_game_info(round, city_hp, manticore_hp)
  puts "STATUS: Round: #{round}  City: #{city_hp}/#{CITY_MAX_HP}  Manticore: #{manticore_hp}/#{MANTICORE_MAX_HP}".black.on_blue
  puts "The cannon is expected to deal #{round.cannon_damage} damage this round.".blue
end

def main

  manticore_distance = ask_for_number_in_range(PROMPT, MIN_DISTANCE, MAX_DISTANCE)

  manticore_hp = MANTICORE_MAX_HP
  city_hp = CITY_MAX_HP
  round = 1

  system 'clear'
  puts 'Player 2, it is your turn.'

  while (city_hp > 0) && (manticore_hp > 0)
    puts '----------------------------------------'
    display_game_info(round, city_hp, manticore_hp)

    cannon_range = ask_for_number_in_range('Enter desired cannon range: ', 1, 100)

    if cannon_range > manticore_distance
      puts 'That round OVERSHOT the target.'.magenta
    elsif cannon_range < manticore_distance
      puts 'That round FELL SHORT of the target.'.magenta
    else
      puts 'That round was a DIRECT HIT!'.green
      manticore_hp -= round.cannon_damage
    end
 
    city_hp -= 1
    round += 1
  end

  if city_hp <= 0
    puts "The city was destroyed!".red.on_black
  else
    puts "The Manticore has been destroyed! The city of Consolas has been saved!".yellow.blink
  end
end


if __FILE__ == $0
  main
end
