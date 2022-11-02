class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @credit_card = CreditCard.find(params[:credit_card_id])
  end

  def create
    @credit_card = CreditCard.find(params[:credit_card_id])
    @user_id = current_user.id
    @reservation = Reservation.create(start_date: params[:reservation][:start_date], end_date: params[:reservation][:end_date], user_id: @user_id, credit_card: @credit_card)
    redirect_to credit_card_path(@credit_card)
  end

  private

  def reservations_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
