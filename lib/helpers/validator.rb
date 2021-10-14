module Validator
    # These helper methods validate both the inputed string from the form and the hash it eventually becomes
    
    VALID_SUITS = %w(C D H S).freeze
    VALID_VALUES = (1..14).freeze


    def invalid_input?(card_string)
        # Early exit for obvious problems -- no input
         return true if card_string.nil? || card_string.empty?
         card_arr = card_string.split(" ")

        # Invalidate if fewer/more than 5 cards are provided, or duplicate cards are provided
         return true if card_arr.length != 5 || card_arr.uniq.length != card_arr.length

         false
    end

    def invalid_output?(hand_hash)
        # since we know we have 5 unique cards to work with, lets ensure the hand is valid
        return true if invalid_values?(hand_hash.keys) || invalid_suits?(hand_hash.values)

        false 
    end

    def invalid_values?(val_arr)
        val_arr.any? { |val| !VALID_VALUES.include?(val) }
    end

    def invalid_suits?(suits_arr)
        # recursively check that each card in the hand is one of the approved suits
        suits_arr.any? do |suit| 
            if suit.is_a?(String)
                !VALID_SUITS.include?(suit) 
            else 
                invalid_suits?(suit)
            end
        end 
    end
end