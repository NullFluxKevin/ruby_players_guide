print 'Enter x: '
x = gets.chomp.to_i

print 'Enter y: '
y = gets.chomp.to_i


direction = ""

if (x == 0) && ( y == 0)
  puts 'Enemy is here!'
  exit
end

if y > 0
  direction += "N"
elsif y < 0
  direction += "S"
end

if x > 0
  direction += "E"
elsif x < 0
  direction += "W"
end

puts "Enemy is at #{direction}"
