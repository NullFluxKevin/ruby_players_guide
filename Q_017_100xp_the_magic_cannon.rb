
require_relative "ansi_text_styles"

class Integer
  def to_blast_type
    if (self % 3 == 0) && (self % 5 == 0)
      "Fire and Electric".blue
    elsif (self % 3 == 0)
      "Fire".red
    elsif (self % 5 == 0)
      "Electric".yellow
    else
      "Normal"
    end
  end
end


def solution_1
  for i in 1..100
    puts "#{i}: #{i.to_blast_type}"
  end
end


def solution_2
  100.times { |i| puts "#{i + 1}: #{(i + 1).to_blast_type}" }
end


def solution_3
  (1..100).each { |i| puts "#{i}: #{i.to_blast_type}" }
end

if __FILE__ == $0
  solution_3
end
