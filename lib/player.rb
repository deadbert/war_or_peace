class Player
    attr_reader :name
    attr_accessor :deck
    def initialize(name, deck)
        @name = name
        @deck = deck
    end

    def has_lost?
        @deck.cards.count == 0 ? true : false   
    end

end