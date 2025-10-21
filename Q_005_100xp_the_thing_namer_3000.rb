puts 'What kind of thing are we talking about?'
# Get the thing
thing = gets.chomp

puts 'How would you describe it? Big? Azure? Tattered?'
# Describe the thing
adj = gets.chomp

suffix_1 = 'Doom'
suffix_2 = '3000'

puts "The #{adj} #{thing} of #{suffix_1} #{suffix_2}"
