class Card

  # https://rosettacode.org/wiki/Playing_cards#Ruby

  # class constants
  SUITS = %i[ C D H S ]
  RANKS  = %i[ A K Q J 10 9 8 7 6 5 4 3 2]
  VALUES = {J: 1, Q: 2, K: 3, A: 4}
  VALUES.default = 0

  # class variables (private)
  @@suit_order = Hash[ SUITS.each_with_index.to_a ]
  @@rank_order  = Hash[ RANKS.each_with_index.to_a ]
 
  attr_reader :rank, :suit, :value
 
  def initialize(rank,suit)
    @rank = rank
    @suit = suit
    @value = VALUES[rank]
  end
 
  def to_s
    "#{@suit}#{@rank}"
  end
  # allow sorting an array of Cards: first by suit, then by value
  def <=>(other)
    (@@suit_order[@suit] <=> @@suit_order[other.suit]).nonzero? or
    @@rank_order[@rank] <=> @@rank_order[other.rank]
  end
 
end