class Deck 
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        if @cards[index] == nil
            0
        else
            @cards[index].rank
        end
    end

    def high_ranking_cards
        high_cards = @cards.reject do |card|
            card.rank < 10
        end
    end

    def percent_high_ranking
        percent = (Float(high_ranking_cards.count) / Float(@cards.count))
    end

    def remove_card
        removed_card = @cards.shift
    end

    def add_card(card)
        @cards << card
    end
end
