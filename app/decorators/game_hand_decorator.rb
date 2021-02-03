class GameHandDecorator < Draper::Decorator
  delegate_all

  def clubs
    clubs = []
    hand = object.cards.split(" ")
    print(hand)
    hand.each do |card|
      if card[0] == 'C' then clubs.append(card[1,2]) end
    end
    clubs.join(", ")
  end

  def diamonds
    diamonds = []
    object.cards.split(" ").each do |card|
      if card[0] == 'D' then diamonds.append(card[1,2]) end
    end
    diamonds.join(", ")
  end

  def hearts
    hearts = []
    object.cards.split(" ").each do |card|
      if card[0] == 'H' then hearts.append(card[1,2]) end
    end
    hearts.join(", ")
  end

  def spades
    spades = []
    object.cards.split(" ").each do |card|
      if card[0] == 'S' then spades.append(card[1,2]) end
    end
    spades.join(", ")
  end

end
