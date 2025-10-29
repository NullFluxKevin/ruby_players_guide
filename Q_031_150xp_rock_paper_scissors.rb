
OPTIONS = %i{Rock Paper Scissors}

MENU = OPTIONS.map.with_index(1) { |opt, i| "#{i} - #{opt}\n" }


def pick_option
  selected = nil

  until selected&.between?(1, OPTIONS.size)
    puts MENU
    selected = gets.chomp.to_i
  end

  OPTIONS[selected - 1]  
end


if __FILE__ == $0

  scores = {
    p1: 0,
    p2: 0,
    draws: 0,
  }

  loop do
    puts "#P1:#{scores[:p1]} P2:#{scores[:p2]} Draws:#{scores[:draws]}"

    puts "P1's Turn"
    p1 = pick_option

    puts "P2's Turn"
    # p2 = pick_option
    p2 = OPTIONS.sample

    puts "P1: #{p1}; P2: #{p2}"
    if p1 == p2
      puts "Draw"
      scores[:draws] += 1
      next
    end

    case [p1, p2]
    when [:Rock, :Scissors], [:Paper, :Rock], [:Scissors, :Paper]
      puts "P1 wins"
      scores[:p1] += 1
    else
      puts "P2 wins"
      scores[:p2] += 1
    end

  end
end
