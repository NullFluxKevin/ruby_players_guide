
class Door
  module State
    LOCKED = :locked
    OPEN = :open
    CLOSED = :closed
  end

  attr_reader :state

  def initialize(password)
    @password = password
    @state = Door::State::LOCKED
  end

  def change_password(current_code, new_code)
    @password = new_code if current_code == @password
  end

  def unlock(password)
    @state = Door::State::CLOSED if (@state == Door::State::LOCKED) && (password == @password)
  end

  def open
    @state = Door::State::OPEN if @state == Door::State::CLOSED
  end

  def close
    @state = Door::State::CLOSED if @state == Door::State::OPEN
  end

  def lock
    @state = Door::State::LOCKED if @state == Door::State::CLOSED
  end
end


if __FILE__ == $0
  print "Enter a password for the door: "
  door = Door.new(gets.chomp)

  operations = {
    open: :open,
    close: :close,
    lock: :lock,
    unlock: :unlock,
    "change password": :change_password,
  }

  loop do
    loop do
      puts "The Door is #{door.state}. What do you want to do?"

      operations.keys.each do |k|
        puts k
      end

      command = gets.chomp.downcase.to_sym


      next unless operations.keys.include? command

      operation = operations[command]

      case operation

      when :unlock
        next unless door.state == Door::State::LOCKED

        print "Enter password to unlock the door: "
        door.unlock(gets.chomp)
      when :change_password
        print "Enter the current password: "
        current_code = gets.chomp
        print "Enter the new password: "
        new_code = gets.chomp
        if door.change_password(current_code, new_code)
          puts "password updated."
        else
          puts "Failed to update the password."
        end
      else
        door.send operations[command]
      end

    end

  end

end
