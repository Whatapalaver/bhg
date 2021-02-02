class GameDecorator < Draper::Decorator
  delegate_all
  decorates_association :game_hand

end
