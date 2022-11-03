class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @credit_card = CreditCard.find(params[:credit_card_id])
  end

  def create
    @credit_card = CreditCard.find(params[:credit_card_id])
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

  def reservations_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
