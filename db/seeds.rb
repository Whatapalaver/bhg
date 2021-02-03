# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Game.destroy_all
GameHand.destroy_all

100.times do |i|
  deck = Deck.new.shuffle!
  game = Game.create!(seed: i+1)
  north = game.game_hands.create!(direction: :N, cards: deck.deal(13).sort().map {|card| card.to_s}.join(" "))
  south = game.game_hands.create!(direction: :S, cards: deck.deal(13).sort().map {|card| card.to_s}.join(" "))
  east = game.game_hands.create!(direction: :E, cards: deck.deal(13).sort().map {|card| card.to_s}.join(" "))
  west = game.game_hands.create!(direction: :W, cards: deck.deal(13).sort().map {|card| card.to_s}.join(" "))
end