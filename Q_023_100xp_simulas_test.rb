
class State
  attr_reader :state
  private_class_method :new

  def initialize(state)
    @state = state
  end

  def to_s
    state
  end

  OPEN = new("open")
  LOCKED = new("locked")
  UNLOCKED = new("unlocked")
end

class Chest
  attr_reader :state

  def initialize
    @state = State::LOCKED
  end

  def open
    @state = State::OPEN if @state == State::UNLOCKED
  end

  def close
    @state = State::UNLOCKED if @state == State::OPEN
  end

  def lock
    @state = State::LOCKED if @state == State::UNLOCKED
  end

  def unlock
    @state = State::UNLOCKED if @state == State::LOCKED
  end
end


if __FILE__ == $0
  chest = Chest.new

  loop do
    puts "Chest is #{chest.state}. What do you want to do? "

    command = gets.chomp.downcase

    chest.send(command) if chest.respond_to?(command)
  end

end

