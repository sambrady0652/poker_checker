require 'helpers/validator'
require 'helpers/hand_creator'
require 'helpers/pretty_printer'
require 'helpers/counting_help'

class CardEvaluator
    include Validator
    include HandCreator
    include PrettyPrinter
    include CountingHelp

    INVALID = "Invalid hand".freeze
    HANDS = %i(
      royal_flush
      straight_flush
      four_of_a_kind
      full_house
      flush
      straight
      three_of_a_kind
      two_pair
      pair
    ).freeze    

    def initialize(cards: )
        @cards = hash(cards)
    end

    def evaluate
        return INVALID if @cards == INVALID
        hand = HANDS.find { |hand| send(hand) }
        hand ? pretty_print(hand) : high_card
    end

    def royal_flush
      straight_flush && @cards.keys == [10, 11, 12, 13, 14]
    end 

    def straight_flush
      straight && flush
    end 

    def four_of_a_kind
      count(@cards).include?(4)
    end 

    def full_house
      (count(@cards) - [2, 3]).empty?
    end 

    def flush
      @cards.values.flatten.uniq.size == 1
    end 

    def straight
      @cards.keys == (@cards.keys[0]..@cards.keys[-1]).to_a
    end 

    def three_of_a_kind
      count(@cards).include?(3)
    end 

    def two_pair
      count(@cards).filter { |count| count == 2 }.size == 2
    end 

    def pair
      count(@cards).filter { |count| count == 2 }.size == 1
    end 

    def high_card
      prettify_high_card(@cards)
    end 
end