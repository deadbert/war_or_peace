require_relative 'card.rb'
require_relative 'player.rb'
require_relative 'deck.rb'
require_relative 'turn.rb'

def make_suit(suit, deck)
    2.upto(10) do |i|
        deck << Card.new(suit, "#{i}", i)
    end

    deck << Card.new(suit, "Jack", 11)
    deck << Card.new(suit, "Queen", 12)
    deck << Card.new(suit, "King", 13)
    deck << Card.new(suit, "Ace", 14)
end

def make_deck
    deck_array = []
    make_suit(:spade, deck_array)
    make_suit(:club, deck_array)
    make_suit(:heart, deck_array)
    make_suit(:diamond, deck_array)
    deck_array
end

deck_array = make_deck()
# divy deck_array into 2 equal arrays of card objects
# that will be passed to the Deck object
deck_1 = []
deck_2 = []
26.times {deck_1 << deck_array.sample()}
26.times {deck_2 << deck_array.sample()}

# take both random Card object arrays and create 2
# Deck objects
player_1_deck = Deck.new(deck_1)
player_2_deck = Deck.new(deck_2)

# this line of code is to check that the decks have been
# split randomly into Deck objects
# player_1_deck.cards.each do |card|
#     puts "#{card.value} of #{card.suit}: #{card.rank}"
# end

player_1 = Player.new("Megan", player_1_deck)
player_2 = Player.new("Aurora", player_2_deck)


puts "Welcomem to War! (or Peace) This game willby played with 52 card."
puts "The players today are megan and Aurora."
puts "Type 'GO' to start the game!"

input = gets.chomp
turn_counter = 1
if input == "GO"
    until player_1.has_lost? || player_2.has_lost? || turn_counter == 1000000 do
        next_turn = Turn.new(player_1, player_2)
        next_turn.type
        next_turn.winner
        puts "Turn #{turn_counter}: #{next_turn.print_winner}"
        next_turn.pile_cards
        next_turn.award_spoils
        puts "Turn #{turn_counter} card chages Megan:#{player_1.deck.cards.length} Aurora:#{player_2.deck.cards.length}"
        turn_counter += 1
        if player_1.has_lost? || player_2.has_lost? 
            puts "*~*~*~* #{next_turn.winner.name} has won the game! *~*~*~*"
        end
    end
end


