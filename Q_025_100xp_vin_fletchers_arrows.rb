
SHAFT_UNIT_PRICE = 0.05

class Arrow
  attr_reader :arrowhead, :fletching, :length

  def initialize(arrowhead, fletching, length)
    @arrowhead = arrowhead
    @fletching = fletching 
    @length = length 
  end

  def cost
    arrowhead.price + fletching.price + SHAFT_UNIT_PRICE * length
  end

  def to_s
    "#{length} cm #{arrowhead} arrow with #{fletching} fletching"
  end
end


Product = Data.define(:type, :price)

Fletching = Product
Arrowhead = Product

class Product
  def to_s
    type
  end
end


def pick_from_menu(products, prompt)
  loop do
    products.each_with_index do |p, i|
      puts "#{i + 1} - #{p.type} (#{p.price} gold)"
    end

    print prompt

    index = gets.chomp.to_i - 1
    if index.between?(0, products.size - 1)
      return products[index]
    end
  end
end


if __FILE__ == $0

  arrowheads = [
    Arrowhead.new("steel", 10),
    Arrowhead.new("wood", 3),
    Arrowhead.new("obsidian", 5)
  ]

  fletchings = [
    Fletching.new("plastic", 10),
    Fletching.new("goose feathers", 3),
    Fletching.new("turkey feathers", 5)
  ]

  arrowhead = pick_from_menu(arrowheads, "Pick the arrowhead: ")
  fletching = pick_from_menu(fletchings, "Pick the fletching: ")

  length = nil
  loop do
    print "Enter shaft length (#{SHAFT_UNIT_PRICE} gold per centimeter): "
    length = gets.chomp.to_i
    break if length > 0
  end

  arrow = Arrow.new(arrowhead, fletching, length)
  puts "Total cost for #{arrow}: #{arrow.cost} gold"

end
