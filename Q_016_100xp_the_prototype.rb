
value = -1

loop do
  print 'User 1, enter a number between 0 and 100 (including both): '
  entered = gets.chomp.to_i
  if entered.between?(0, 100)
    value = entered
    break
  end
end

system('clear')

puts "User 2, guess the number."

loop do
  print "What is your next guess? "
  guessed = gets.chomp.to_i

  if guessed > value
    puts "#{guessed} is too high."
  elsif guessed < value
    puts "#{guessed} is too low."
  else
    puts "You guessed the number!"
    break
  end
end
