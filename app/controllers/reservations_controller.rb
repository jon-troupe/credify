class ReservationsController < ApplicationController
  before_action :set_credit_card, only: %i[new create]
  before_action :set_reservation, only: %i[destroy]

  def show
    @reservations_all = Reservation.all
    @reservations = @reservations_all.select { |reservation| reservation.user_id == current_user.id }
  end

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

  def destroy
    @reservation.destroy
    redirect_to credit_card_path(@reservation.credit_card_id)
  end

  private

  def set_credit_card
    @credit_card = CreditCard.find(params[:credit_card_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservations_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
