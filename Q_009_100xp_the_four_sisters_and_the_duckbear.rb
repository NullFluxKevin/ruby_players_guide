
puts 'How many eggs today?'
eggs = gets.chomp.to_i
per_sister = eggs / 4
duckbear = eggs % 4

puts "Each sister gets: #{per_sister}"
puts "Duckbear gets: #{duckbear}"
