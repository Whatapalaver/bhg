class Game < ApplicationRecord
  enum category: { random: "random", competition: "competition", skew: "skew" }

  has_many :game_hands, inverse_of: :game
  accepts_nested_attributes_for :game_hands, allow_destroy: true, reject_if: :all_blank
end