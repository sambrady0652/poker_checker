class CardEvaluator

    def initialize(cards: )
        @cards = cards
    end

    def evaluate!
        return "Invalid hand" if invalid_hand

        "valuable"
    end

    def invalid_hand
    end
end