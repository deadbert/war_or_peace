require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    it "exists with a name and a deck" do
        player = Player.new("Nick", deck)
        
        expect(player.name).to eq("Nick")
        expect(player.deck).to eq(deck)
    end
end