
# In Ruby enum is just a limited set of values
# 
# Two enum approaches
 

module PickFromConstants
  def pick(prompt)
    loop do
      puts prompt
      constants.each do |symbol|
        puts const_get(symbol)
      end

      print ">> "
      entered = gets.chomp.upcase.to_sym
      if constants.include?(entered)
        return const_get(entered) 
      end
    end
  end
end


class FoodType
  # When you need behaviors attached to the enum value
  # More verbose than using module

  extend PickFromConstants

  attr_reader :name
  private_class_method :new


  def initialize(name)
    @name = name
  end

  SOUP = new(:Soup)
  STEW = new(:Stew)
  GUMBO = new(:Gumbo)

  def to_s
    @name.to_s
  end

  # necessary extra unwrapping
  def self.pick(prompt)
    super&.name
  end

end


# When your enum doesn't need behaviors
module Ingredient
  extend PickFromConstants

  MUSHROOMS = :Mushrooms
  CHICKEN = :Chicken
  CARROTS = :Carrots
  POTATOES = :Potatoes
end


module Seasoning
  extend PickFromConstants

  SPICY = :Spicy
  SALTY = :Salty
  SWEET = :Sweet
end


if __FILE__ == $0
  food = [
    Seasoning.pick("Pick seasoning: "),
    Ingredient.pick("Pick main ingredient: "),
    FoodType.pick("Pick food type: "),
  ]

  print "You ordered "
  food.each { |part| print "#{part} " }
  puts

end
