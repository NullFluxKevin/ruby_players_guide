
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

  def self.elite_arrow
    new(Arrowhead::STEEL, Fletching::PLASTIC, 95)
  end

  def self.beginner_arrow
    new(Arrowhead::WOOD, Fletching::GOOSE_FEATHERS, 75)
  end

  def self.marksman_arrow
    new(Arrowhead::STEEL, Fletching::GOOSE_FEATHERS, 65)
  end
end


Product = Data.define(:type, :price)

class Product
  def to_s
    type
  end
end


class Arrowhead < Product
  private_class_method :new
  STEEL = new("steel", 10)
  WOOD = new("wood", 3)
  OBSIDIAN = new("obsidian", 5)
end


class Fletching < Product
  private_class_method :new
  PLASTIC = new("plastic", 10)
  GOOSE_FEATHERS = new("goose feathers", 3)
  TURKEY_FEATHERS = new("turkey feathers", 5)
end


def pick_from_menu(products, prompt)
  loop do
    products.each_with_index do |p, i|
      yield p, i
    end

    print prompt

    index = gets.chomp.to_i - 1
    if index.between?(0, products.size - 1)
      return products[index]
    end
  end
end


if __FILE__ == $0

  arrow_types = [
    ["The Elite Arrow", :elite_arrow],
    ["The Beginner Arrow", :beginner_arrow],
    ["The Marksman Arrow", :marksman_arrow],
    ["Custom", nil],
  ]

  arrow_type = pick_from_menu(arrow_types, "Pick Arrow type: ") do |at, i|
    puts "#{i + 1} - " + "#{at[0]}"
  end
  

  if arrow_type[1].nil?

    arrowheads = Arrowhead.constants.map { |sym| Arrowhead.const_get(sym) }
    fletchings = Fletching.constants.map { |sym| Fletching.const_get(sym) }

    arrowhead = pick_from_menu(arrowheads, "Pick the arrowhead: ") do |ah, i|
      puts "#{i + 1} - " + "#{ah.type} (#{ah.price} gold)"
    end

    fletching = pick_from_menu(fletchings, "Pick the fletching: ") do |f, i|
      puts "#{i + 1} - " + "#{f.type} (#{f.price} gold)"
    end

    length = nil
    loop do
      print "Enter shaft length (#{SHAFT_UNIT_PRICE} gold per centimeter): "
      length = gets.chomp.to_i
      break if length > 0
    end

    arrow = Arrow.new(arrowhead, fletching, length)

  else
    arrow = Arrow.send(arrow_type[1])
  end

  puts "Total cost for #{arrow}: #{arrow.cost} gold"

end
