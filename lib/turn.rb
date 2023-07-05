class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @type = nil
        @spoils_of_war = []
        @winner = nil
    end

    def type
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            @type = :basic
        else
            @type = @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2) ? :mutually_assured_destruction : :war
        end
    end

    def winner
        if @type == :basic
            @winner = @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) ? @player1 : @player2
        elsif @type == :war
            @winner = @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2) ? @player1 : @player2
        else
            @winner = "No Winner"
        end
    end

    def pile_cards
        if @type == :basic
            @spoils_of_war << @player1.deck.remove_card
            @spoils_of_war << @player2.deck.remove_card
        elsif @type == :war
            3.times {@spoils_of_war << @player1.deck.remove_card}
            3.times {@spoils_of_war << @player2.deck.remove_card}
        else
            3.times {@player1.deck.remove_card}
            3.times {@player2.deck.remove_card}
        end
    end

    def award_spoils
        spoils_of_war.each do |card|
            @winner.deck.add_card(card)
        end
    end
end