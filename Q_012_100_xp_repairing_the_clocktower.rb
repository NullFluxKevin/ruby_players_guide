print 'Enter a number: '
num = gets.chomp.to_i

sound = num.even? ? "Tick" : "Tock"

puts "#{sound}"

