require 'card_evaluator'

class HandsController < ApplicationController
  def show
    @hand = Hand.find(params[:id])
  end

  def new
  end 

  def create
    @hand = Hand.new(params.require(:hand).permit(:cards))
    @hand.value = CardEvaluator.new(cards: params.dig("hand","cards")).evaluate
    # normally I would include some validation here before saving anything to DB
    @hand.save
    redirect_to @hand
  end
end
