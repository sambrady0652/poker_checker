module Validator

    VALID_SUITS = %w(C D H S).freeze
    VALID_VALUES = %w(1 2 3 4 5 6 7 8 9 10 J Q K A)


    def invalid_input(card_string)
        # Early exit for obvious problems -- no input
         return true if card_string.nil? || card_string.empty?
         card_arr = card_string.split(" ")

        # Invalidate if fewer/more than 5 cards are provided, or duplicate cards are provided
         return true if card_arr.length != 5 || card_arr.uniq.length != card_arr.length

         false
    end

    def invalid_output(hand_hash)
        # since we know we have 5 unique cards to work with, lets ensure the hand is valid
        return true if hand_hash.values.any? { |suit| !VALID_SUITS.include?(suit) } || # Invalid suit check 
                    hand_hash.keys.any? { |val| !VALID_VALUES.include?(val) } # Invalid values check

        false 
    end
end