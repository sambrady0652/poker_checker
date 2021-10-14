module CountingHelp
    # helper method for repeated math

    # returns array of integers, representing the number of suits associated with each card.
    def count(cards) 
        cards.values.map { |suits_arr| suits_arr.length }
    end
end