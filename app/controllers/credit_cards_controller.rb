class CreditCardsController < ApplicationController
  before_action :set_cc, only: %i[show update destroy edit]

  def index
    if params[:type].present?
      @credit_cards = CreditCard.where(card_type: params[:type])
      @type = "<span class='bg-info'>#{params[:type]}</span> "
    else
      @credit_cards = CreditCard.all
    end
  end

  def my_cards
    @credit_cards = CreditCard.select { |card| card.user_id == current_user.id }
  end

  def show
    @reservation = Reservation.new
    @reservations = Reservation.all
    @reservations = @reservations.select { |reservation| reservation.credit_card_id == @credit_card.id }

    @marker =
      {
        lat: @credit_card.latitude,
        lng: @credit_card.longitude
      }
  end

  def new
    @credit_card = CreditCard.new
    @credit_card.user_id = current_user.id
  end

  def create
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.user = current_user
    if @credit_card.save
      redirect_to my_cards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @credit_card.update(credit_card_params)
    redirect_to credit_card_path(@credit_card)
  end

  def destroy
    if @credit_card.user_id == current_user.id
      @credit_card.destroy
      redirect_to credit_cards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_cc
    @credit_card = CreditCard.find(params[:id])
  end

  def credit_card_params
    params.require(:credit_card).permit(:number, :pin, :cardholder, :card_type,
    :card_issuer, :credit_limit, :address, :date, :price_per_day)
  end
end
