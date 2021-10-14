module HandCreator
    INVALID = "Invalid hand".freeze
    
    # convert an input hand string into a more useful hash
    # eg input "2h 2c 3h 4d ah"
    # eg output:
    # {
    #     2: ["H", "C"],
    #     3: ["H"],
    #     4: ["D"],
    #     14: ["H"]
    # }

    def hash(card_string)
        return INVALID if invalid_input?(card_string) # ensure valid string before proceeding

        hand_hash = card_string.split(" ").each_with_object({}) do |card, hand|
            suit = card[-1].upcase
            val = convert_val!(card[0..-2].upcase)
            if hand[val]
                hand[val] << suit
            else 
                hand[val] = [suit]
            end
        end

        return INVALID if invalid_output?(hand_hash) # ensure values that were provided are valid

        hand_hash.sort_by { |k,v| k}.to_h
    end

    # converts face cards to corresponding numeric values, to make comparisons easier
    def convert_val!(value_string)
      case value_string
      when "J" then 11
      when "Q" then 12
      when "K" then 13
      when "A" then 14
      else value_string.to_i
      end
    end
end