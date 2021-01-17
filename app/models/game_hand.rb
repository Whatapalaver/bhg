class GameHand < ApplicationRecord
  enum direction: { N: "N", S: "S", E: "E", W: "W" }

  belongs_to :game
end
