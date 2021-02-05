class GameHandDecorator < Draper::Decorator
  delegate_all

  def clubs
    clubs = []
    hand.each do |card|
      if card[0] == 'C' then clubs.append(card[1,2]) end
    end
    clubs.join(", ")
  end

  def diamonds
    diamonds = []
    hand.each do |card|
      if card[0] == 'D' then diamonds.append(card[1,2]) end
    end
    diamonds.join(", ")
  end

  def hearts
    hearts = []
    hand.each do |card|
      if card[0] == 'H' then hearts.append(card[1,2]) end
    end
    hearts.join(", ")
  end

  def spades
    spades = []
    hand.each do |card|
      if card[0] == 'S' then spades.append(card[1,2]) end
    end
    print(spades)
    spades.join(", ")
  end

  def points
    hand.reduce(0) {|accum, card| accum + Card::VALUES[card[1,2].to_sym]} 
  end

  def hand
    object.cards.split(" ")
  end

  def distribution
    dist = []
    dist.append(clubs.split(', ').length)
    dist.append(diamonds.split(', ').length)
    dist.append(hearts.split(', ').length)
    dist.append(spades.split(', ').length)
    dist.sort!.reverse!
    dist.join("-")
  end

end
