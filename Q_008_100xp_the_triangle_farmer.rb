
puts "Enter base: "
base = gets.chomp.to_f
puts "Enter height: "
height = gets.chomp.to_f

area = base * height / 2
puts "The area of the triangle is #{'%.2f' % area}"
