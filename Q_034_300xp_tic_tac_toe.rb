
class TicTacToe
  TOKEN_1 = :X
  TOKEN_2 = :O
  EMPTY = :" "

  def initialize
    @board = Array.new(9)
    @token = TOKEN_1
  end

  def valid?(position)
    index = position - 1
    if not index.between?(0, 8)
      puts "Invalid position. Please try again."
      false
    elsif not @board[index].nil?
      puts "Position is occupied. Please try again."
      false
    else
      true
    end
  end

  def same_tokens?(*positions)
    tokens = positions.map { |pos| @board[pos] }
    compacted = tokens.compact
    # can't use and instead of && because of op precedence
    res = (compacted.size == 3) && (compacted.uniq.size == 1)
    res
  end

  def win?
    # check rows
    3.times do |i|
      return true if same_tokens? 0 + i, 1 + i, 2 + i
    end

    # check cols
    3.times do |i|
      return true if same_tokens? 0 + i, 3 + i, 6 + i
    end

    # check diagonals
    return true if same_tokens? 0, 4, 8
    return true if same_tokens? 2, 4, 6
    
    false
  end

  def draw?
    @board.compact.size == 9 and not win?
  end

  def show_board
    puts ""
    rows = @board.map { |token| token.nil? ? EMPTY : token }

    rows = rows.each_slice(3).to_a.reverse.map do |row|
      " " + row.join(" | ") + " "
    end
    puts rows.join("\n---+---+---\n")
    puts ""
  end
  
  def run
    loop do
      loop do
        show_board
        puts "It's #{@token}'s turn"
        print "Pick a position (1~9): "
        position = gets.chomp.to_i
        if valid? position
          @board[position - 1] = @token
          break
        end
      end

      if win?
        show_board
        puts "#{@token} wins!"
        return
      elsif draw?
        show_board
        puts "Draw!"
        return
      else
        @token = @token == TOKEN_1 ? TOKEN_2 : TOKEN_1
      end
      
    end
  end
end

if __FILE__ == $0
  game = TicTacToe.new
  game.run
end
