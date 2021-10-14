require 'helpers/validator'

class CardEvaluator
    include Validator

    INVALID = "Invalid hand".freeze

    def initialize(cards: )
        @cards = hash(cards)
    end

    def evaluate
        return INVALID if @cards == INVALID
    
        "valuable"
    end

    def hash(card_string)
        return INVALID if invalid_input(card_string)

        hand_hash = card_string.split(" ").each_with_object({}) do |card, hand|
            suit = card[-1].upcase
            val = card[0..-2].upcase
            hand[val] = suit
        end

        return INVALID if invalid_output(hand_hash)

        hand_hash
    end
end