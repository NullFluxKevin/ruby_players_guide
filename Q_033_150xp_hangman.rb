
class Hangman

  def initialize(guesses, words)
    @target_word = words.sample.upcase
    @remaining_guesses = guesses
    @masked_word = "_" * @target_word.size
    @wrong_letters = []
  end

  def valid?(letter)
    return false if not /^[a-z]$/.match? letter

    letter = letter.upcase

    if @masked_word.include? letter or @wrong_letters.include? letter
      return false
    end

    if @target_word.include?(letter)
      @target_word.chars.each.with_index do |c, i|
        @masked_word[i] = letter if c == letter
      end
    else
      @wrong_letters.push(letter)
      @remaining_guesses -= 1
    end

    true
  end

  def state(with_prompt = true)
    parts = [
      "Word:",
      @masked_word,
      "Remaining: #{@remaining_guesses}",
      "Incorrect: #{@wrong_letters.join}",
    ]

    parts << "Guess: " if with_prompt

    parts.join(" | ")
  end


  def over?
    not @masked_word.include? "_" or @remaining_guesses == 0
  end


  def start
    until over?
      loop do
        print state
        letter = gets.chomp
        break if valid? letter
      end
    end

    puts state(false)
    if @masked_word.include? "_"
      puts "You LOSE!"
    else
      puts "You WIN!"
    end
  end

end


if __FILE__ == $0
  words = %w{ immutable game hangman }

  guesses = 3
  game = Hangman.new(guesses, words)

  game.start
end
