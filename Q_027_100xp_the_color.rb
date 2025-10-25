Color = Data.define(:r, :g, :b)

class Color
  def to_s
    "(#{r}, #{g}, #{b})"
  end

  WHITE = new(255, 255, 255)
  BLACK = new(0, 0, 0)
  RED = new(255, 0, 0)
  ORANGE = new(255, 168, 0)
  YELLOW = new(255, 255, 0)
  GREEN = new(0, 128, 0)
  BLUE = new(0, 0, 255)
  PURPLE = new(128, 0, 128)
end


if __FILE__ == $0
  c1 = Color.new(111, 222, 123)
  c2 = Color::PURPLE

  puts c1
  puts c2
end
