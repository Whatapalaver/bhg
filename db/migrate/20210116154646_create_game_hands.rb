class CreateGameHands < ActiveRecord::Migration[6.1]
  def change
    create_table :game_hands do |t|
      t.string :direction
      t.string :cards
      t.timestamps
    end
  end
end
