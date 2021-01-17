class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :seed
      t.string :name
      t.string :category, default: 'random'
      t.timestamps
    end
  end
end
