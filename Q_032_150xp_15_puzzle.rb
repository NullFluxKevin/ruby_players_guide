EMPTY = " "
TILES = [*(1..15), EMPTY]
ORDERED = TILES.each_slice(4).to_a

BOARD = TILES.shuffle.each_slice(4).to_a

def show_board
  rep = BOARD.map do |row|
    row.map do |e|
      e.to_s.rjust(2)
    end.join(" ")
  end.join("\n")

  puts rep
end


if __FILE__ == $0
  empty_row = BOARD.index { |row| row.include? EMPTY }
  empty_col = BOARD[empty_row].index { |col| col == EMPTY }

  moves = 0

  loop do
    system 'clear'

    puts "Moves: #{moves}"
    show_board

    key = gets.chomp
    case key
    when "j", "J"

      next if empty_row == 0
      BOARD[empty_row - 1][empty_col], BOARD[empty_row][empty_col] = BOARD[empty_row][empty_col], BOARD[empty_row - 1][empty_col]

      empty_row -= 1
      moves += 1

    when "k", "K"
      next if empty_row == BOARD.size - 1

      BOARD[empty_row + 1][empty_col], BOARD[empty_row][empty_col] = BOARD[empty_row][empty_col], BOARD[empty_row + 1][empty_col]

      empty_row += 1
      moves += 1

    when "h", "H"
      next if empty_col == BOARD[0].size

      BOARD[empty_row][empty_col + 1], BOARD[empty_row][empty_col] = BOARD[empty_row][empty_col], BOARD[empty_row][empty_col + 1]

      empty_col += 1
      moves += 1

    when "l", "L"
      next if empty_col == 0

      BOARD[empty_row][empty_col - 1], BOARD[empty_row][empty_col] = BOARD[empty_row][empty_col], BOARD[empty_row][empty_col - 1]

      empty_col -= 1
      moves += 1
    else
      next
    end
  
  
    if BOARD == ORDERED
      puts "You win"
      break
    end
  end
end
