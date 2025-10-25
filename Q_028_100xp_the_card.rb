
module Color
  RED = :Red
  GREEN = :Green
  BLUE = :Blue
  YELLOW = :Yellow
end

module Rank
  ONE = :One
  TWO = :Two
  THREE = :Three
  FOUR = :Four
  FIVE = :Five
  SIX = :Six
  SEVEN = :Seven
  EIGHT = :Eight
  NINE = :Nine
  TEN = :Ten
  DOLLAR = :Dollar
  PERCENT = :Percent
  CARET = :Caret
  AMPERSAND = :Ampersand
end

Card = Data.define(:color, :rank)

class Card
  def to_s
    "The #{color} #{rank}"
  end
  
  def self.deck
    cards = []

    Color.constants.each do |card_sym|
      color = Color.const_get(card_sym)

      Rank.constants.each do |rank_sym|
        rank = Rank.const_get(rank_sym)

        cards << new(color, rank)
      end

    end

    cards
  end
end


if __FILE__ == $0
  puts Card.deck
end
