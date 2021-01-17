class Game < ApplicationRecord
  enum category: { random: "random", competition: "competition", skew: "skew" }

  has_many :game_hands
end