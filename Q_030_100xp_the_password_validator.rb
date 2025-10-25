
class PasswordValidator
  def valid?(password)
    password.length.between?(6, 13) &&
    password.match?(/[a-z]+/) &&
    password.match?(/[A-Z]+/) &&
    password.match?(/[0-9]+/) &&
    !password.include?("T") &&
    !password.include?("&")
  end

end

if __FILE__ == $0
  pv = PasswordValidator.new

  loop do
    print "Enter password you want to test: "
    password = gets.chomp

    result = "invalid"
    result = "valid" if pv.valid?(password)
    puts "#{password} is #{result}"
  end
end
