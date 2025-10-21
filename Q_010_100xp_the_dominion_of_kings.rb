POINTS_PER_ESTATE = 1
POINTS_PER_DUCHY = 3
POINTS_PER_PROVINCE = 6

print 'How many estate do you have? '
estates = gets.chomp.to_i
print 'How many duchy do you have? '
duchies = gets.chomp.to_i
print 'How many province do you have? '
provinces = gets.chomp.to_i

total_points = estates * POINTS_PER_ESTATE + duchies * POINTS_PER_DUCHY + provinces * POINTS_PER_PROVINCE

puts "Total points: #{total_points}"
