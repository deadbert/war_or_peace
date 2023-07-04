require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    it "exists" do
        expect(deck).to be_an_instance_of(Deck)
    end

    it "can read cards" do
        expect(deck.cards).to eq(cards)
    end

    it "can read specific cards" do 
        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it "can return high ranking cards" do 
        expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it "can calculate percent of high cards in deck" do
        expect(deck.percent_high_ranking).to eq(2.0 / 3.0)
    end

    it "can remove a card" do 
        deck.remove_card

        expect(deck.cards).to eq([card2, card3])
        expect(deck.high_ranking_cards).to eq([card3])
        expect(deck.percent_high_ranking).to eq(0.5)
    end

    it "can add a card" do
        card4 = Card.new(:club, '5', 5)
        deck.add_card(card4)

        expect(deck.cards).to eq([card2, card3, card4])
        expect(deck.high_ranking_cards).to eq([card3])
        expect(deck.percent_high_ranking).to eq(1.0/3.0)
    end
end