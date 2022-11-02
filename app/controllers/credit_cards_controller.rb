class CreditCardsController < ApplicationController
  before_action :set_cc, only: %i[show update destroy]

  def index
    @credit_cards = CreditCard.all
  end

  def show
  end

  def new
    @credit_card = CreditCard.new
    @credit_card.user_id = current_user.id
  end

  def create
    @credit_card = CreditCard.new(credit_card_params)
    if @credit_card.save
      redirect_to credit_card_path(@credit_card)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @credit_card.destroy
    redirect_to credit_cards_path
  end

  private

  def set_cc
    @credit_card = CreditCard.find(params[:id])
  end

  def credit_card_params
    params.require(:credit_card).permit(:number, :pin, :cardholder, :card_type,
    :card_issuer, :credit_limit, :address, :date, :price_per_day, :user_id)
  end
end
