class Point
  attr_reader :x, :y
  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end
  def to_s
    "(#{x}, #{y})"
  end
end


if __FILE__ == $0
  p1 = Point.new(2, 3)
  p2 = Point.new(-4, 0)
  puts p1
  puts p2
end
