require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    it "exists" do
        deck = Deck.new(cards)

        expect(deck).to be_an_instance_of(Deck)
    end

    it "can read cards" do
        deck = Deck.new(cards)

        expect(deck.cards).to eq(cards)
    end

    it "can read specific cards" do 
        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end
end