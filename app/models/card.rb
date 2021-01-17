class Card

  # https://rosettacode.org/wiki/Playing_cards#Ruby

  # class constants
  SUITS = %i[ C D H S ]
  RANKS  = %i[ 2 3 4 5 6 7 8 9 10 J Q K A ]
  VALUES = {J: 1, Q: 2, K: 3, A: 4}
  VALUES.default = 0
 
  attr_reader :rank, :suit, :value
 
  def initialize(rank,suit)
    @rank = rank
    @suit = suit
    @value = VALUES[rank]
  end
 
  def to_s
    "#{@rank} #{@suit}"
  end
 
end