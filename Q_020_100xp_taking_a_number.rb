
def ask_for_number(prompt)
  print prompt
  gets.chomp.to_i
end

def ask_for_number_in_range(prompt, min, max)
  number = nil
  number = ask_for_number(prompt) until number&.between?(min, max)
  number
end

if __FILE__ == $0
  num = ask_for_number_in_range("Enter a number between 1 and 100: ", 1, 100)
  puts num
end
