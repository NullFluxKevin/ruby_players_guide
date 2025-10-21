require_relative "ansi_text_styles"

class Pos
  attr_reader :row, :col

  def initialize(row, col)
    @row = row
    @col = col
  end
  
  def left
    Pos.new(row, col - 1)
  end
  def right
    Pos.new(row, col + 1)
  end
  def up
    Pos.new(row - 1, col)
  end
  def down
    Pos.new(row + 1, col)
  end

  def to_s
    "(#{row}, #{col})"
  end

end

print 'Row: '
row = gets.chomp.to_i
print 'Column: '
col = gets.chomp.to_i

target = Pos.new(row, col)

puts 'Deploying to:'
puts "#{target.up}".yellow
puts "#{target.down}".yellow
puts "#{target.left}".yellow
puts "#{target.right}".yellow
