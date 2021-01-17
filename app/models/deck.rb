class Deck
  def initialize
    @deck = Card::SUITS.product(Card::RANKS).map{|suit,rank,value| Card.new(rank,suit)}
  end
 
  def to_s
    @deck.inspect
  end
 
  def shuffle!
    @deck.shuffle!
    self
  end
 
  def deal(*args)
    @deck.shift(*args)
  end
end
