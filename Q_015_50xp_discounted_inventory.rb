MEMBER_NAME = "John"

print "What is your name? "
name = gets.chomp.downcase

discount = 1

discount = 0.5 if name == MEMBER_NAME.downcase

puts "1 - Rope"
puts "2 - Torches"
puts "3 - Climbing Equipment"
puts "4 - Clean Water"
puts "5 - Machete"
puts "6 - Canoe"
puts "7 - Food Supplies"

print "What number do you want to see the price of? "

index = gets.chomp.to_i


case index
when 1 
  puts "Rope will cost #{10 * discount} gold."
when 2
  puts "Torches will cost #{15 * discount} gold."
when 3
  puts "Climbing Equipment cost #{20 * discount} gold."
when 4
  puts "Clean Water will cost #{1 * discount} gold."
when 5
  puts "Machete will cost #{25 * discount} gold."
when 6
  puts "Canoe will cost #{200 * discount} gold."
when 7
  puts "Food Supplies will cost #{1 * discount} gold."
else
  puts "Item selected is not available."
end
