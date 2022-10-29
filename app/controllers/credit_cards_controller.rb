class CreditCardsController < ApplicationController
  before_action :set_cc, only: %i[show create update delete]

  def index
    @credit_cards = CreditCard.all
  end

  def show
    @credit_card = CreditCard.find(params[:id])
  end

  private

  def set_cc
    @credit_card = CreditCard.find(params[:id])
  end
end
