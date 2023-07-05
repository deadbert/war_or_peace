require './lib/turn'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

describe Turn do
    describe "Basic turn" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        new_turn = Turn.new(player1, player2)

        it "exists and has attributes" do 

            expect(new_turn.player1).to eq(player1)
            expect(new_turn.player2).to eq(player2)
            expect(new_turn.spoils_of_war).to eq([])
        end

        it "determines turn type and winner" do 
            expect(new_turn.type).to eq(:basic)
            expect(new_turn.winner).to eq(player1)
        end

        it "can pile cards into spoils of war" do
            new_turn.pile_cards
            expect(new_turn.spoils_of_war).to eq([card1, card3])
        end

        it "can award spoils of war to the winer" do
            new_turn.award_spoils
            expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
            expect(player2.deck.cards).to eq([card4, card6, card7])
        end
    end

    describe "war turn" do
        card1 = Card.new(:heart, 'Jack', 11)    
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)   

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card4, card3, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)   

        turn = Turn.new(player1, player2)  
        
        it "detects war turn" do 
            expect(turn.type).to eq(:war)
        end

        it "detects winner in war" do
            expect(turn.winner).to eq(player2)
        end

        it "piles cards and awards spoils of war" do
            turn.pile_cards
            expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
        end

        it "can award spoils of war to winner" do
            turn.award_spoils
            expect(player1.deck.cards).to eq([card8])
            expect(player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
        end
    end

    describe "Mutual destruction turn" do 
        card1 = Card.new(:heart, 'Jack', 11)    
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, '8', 8)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card4, card3, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    
        
        turn = Turn.new(player1, player2)   
        
        it "can determine mutually assured destruction" do
            expect(turn.type).to eq(:mutually_assured_destruction)
        end

        it "detects winner in war" do
            expect(turn.winner).to eq("No Winner")
        end

        it "piles cards and awards spoils of war" do
            turn.pile_cards
            expect(turn.spoils_of_war).to eq([])
        end

        it "can burn the spoils of war cards" do
            turn.award_spoils
            expect(player1.deck.cards).to eq([card8])
            expect(player2.deck.cards).to eq([card7])
        end
    end
end