class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.find(params[:donation_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.donation = @donation
    @reservation.user = current_user
    @reservation.status = "Pending"

    if reservation.save
      redirect_to donation_path
    else
      render :new
    end
  end
  
  def show
  	@donation = Donation.find(params.[:donation_id])
  	@reservation = Reservation.find(params[:id])
  	@reservation = @donation.reservation
  end

  def update
  	@donation = Donation.find(params.[:donation_id])
  	@reservation = Reservation.find(params[:id])
  	@reservation.status = "Pending"
    @reservation.save!
    redirect_to donation_reservation_path
  end

  def destroy
    @donation = Donation.find(params[:donation_id])
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to root_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status)
  end
end
