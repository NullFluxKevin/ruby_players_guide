
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
  puts "Rope will cost 10 gold."
when 2
  puts "Torches will cost 15 gold."
when 3
  puts "Climbing Equipment cost 20 gold."
when 4
  puts "Clean Water will cost 1 gold."
when 5
  puts "Machete will cost 25 gold."
when 6
  puts "Canoe will cost 200 gold."
when 7
  puts "Food Supplies will cost 1 gold."
else
  puts "Item selected is not available."
end
