class ReservationsController < ApplicationController
  before_action :set_credit_card, only: %i[new create]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @reservation.credit_card = @credit_card
    @reservation.user = current_user
    if @reservation.save
      redirect_to credit_card_path(@credit_card)
    else
      render :new, :unprocessable_entity
    end
  end

  private

  def set_credit_card
    @credit_card = CreditCard.find(params[:credit_card_id])
  end

  def reservations_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
