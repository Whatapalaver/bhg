class Game < ApplicationRecord
  enum category: { random: "random", competition: "competition", skew: "skew" }

  has_many :game_hands, inverse_of: :game, dependent: :destroy
  accepts_nested_attributes_for :game_hands, allow_destroy: true, reject_if: :all_blank

  validates :seed, presence: true, uniqueness: true, on: :create

  before_validation do
    if seed.blank?
      self.seed = Game.maximum(:seed).to_i.next
    end
  end

  def to_param
    seed
  end
end