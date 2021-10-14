require 'helpers/validator'
require 'helpers/hand_creator'
require 'helpers/pretty_printer'

class CardEvaluator
    include Validator
    include HandCreator
    include PrettyPrinter

    INVALID = "Invalid hand".freeze
    POSSIBLE_HANDS = %i(
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
      hand = POSSIBLE_HANDS.find { |hand| send(hand) }
      hand ? pretty_print(hand) : high_card
    end

    # Possible Hands
    def straight_flush
      straight && flush
    end 

    def four_of_a_kind
      card_count.include?(4)
    end 

    def full_house
      (card_count - [2, 3]).empty?
    end 

    def flush
      @cards.values.flatten.uniq.size == 1
    end 

    def straight
      # This one is ugly because Aces can be both High and Low.
      # Since this is the only condition something like this will happen, I treated it as an edge case
      @cards.keys == (@cards.keys[0]..@cards.keys[-1]).to_a || @cards.keys == [2, 3, 4, 5, 14]
    end 

    def three_of_a_kind
      card_count.include?(3)
    end 

    def two_pair
      card_count.filter { |count| count == 2 }.size == 2
    end 

    def pair
      card_count.any? { |count| count == 2 }
    end 

    def high_card
      prettify_high_card(@cards)
    end 

    # Helper
    def card_count
      @cards.values.map { |suits_arr| suits_arr.length }
    end
end