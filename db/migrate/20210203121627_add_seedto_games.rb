class AddSeedtoGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :seed, :integer
  end
end
