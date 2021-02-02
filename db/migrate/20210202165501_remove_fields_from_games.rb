class RemoveFieldsFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :seed, :integer
    remove_column :games, :name, :string
  end
end
