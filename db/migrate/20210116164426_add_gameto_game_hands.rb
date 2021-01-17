class AddGametoGameHands < ActiveRecord::Migration[6.1]
  def change
    add_reference :game_hands, :game
  end
end
