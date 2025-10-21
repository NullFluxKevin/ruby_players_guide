
class Item
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

def show_menu(items)
  puts "The following items are available:"
  items.each_with_index do |item, i|
    puts "#{i + 1} - #{item.name}"
  end
end


if __FILE__ == $0

  items = [
    Item.new("Rope", 10),
    Item.new("Torches", 15),
    Item.new("Climbing Equipment", 25),
    Item.new("Clean Water", 1),
    Item.new("Machete", 20),
    Item.new("Canoe", 200),
    Item.new("Food Supplies", 1),
  ]

  show_menu items

  print "What number do you want to see the price of? "

  one_based_index = gets.chomp.to_i

  index = one_based_index - 1

  puts "#{items[index].name} will cost #{items[index].price} gold."
end
