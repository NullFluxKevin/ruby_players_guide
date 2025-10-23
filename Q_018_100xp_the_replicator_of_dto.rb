
SIZE = 5

arr_1 = Array.new(SIZE)

SIZE.times do |i|
  print 'Enter a number: '
  num = gets.chomp.to_i
  arr_1[i] = num
end

arr_2 = Array.new(arr_1.size)

arr_1.each_with_index { |item, i| arr_2[i] = item }

arr_1.size.times do |i|
  puts "arr_1[#{i}]: #{arr_1[i]}, arr_2[#{i}]: #{arr_1[i]}"
end
