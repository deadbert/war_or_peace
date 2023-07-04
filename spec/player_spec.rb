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
    player = Player.new("Nick", deck)

    it "exists with a name and a deck" do
        
        expect(player.name).to eq("Nick")
        expect(player.deck).to eq(deck)
    end

    it "Knows when it's lost" do
        expect(player.has_lost?).to eq(false)
        player.deck.remove_card
        expect(player.has_lost?).to eq(false)
        player.deck.remove_card
        expect(player.has_lost?).to eq(false)
        player.deck.remove_card
        expect(player.has_lost?).to eq(true)
        p player.deck
    end
end