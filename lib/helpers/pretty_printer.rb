module PrettyPrinter
    VALUES = { 11 => "Jack", 12 => "Queen", 13 => "King", 14 => "Ace" }
    SUITS = { "H" => "Hearts", "C" => "Clubs", "D" => "Diamonds", "S" => "Spades" }

    def pretty_print(symbol)
        symbol.to_s.split("_").map(&:capitalize).join(" ")
    end

    def prettify_high_card(cards)
        max = cards.keys.max
        high =  max > 10 ? VALUES[max] : max
        suit = SUITS[cards[max].first]
        
        "High Card: #{high} of #{suit}"
    end
end