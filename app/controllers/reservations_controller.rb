class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @donation = Donation.find(params[:donation_id])
    @reservation = Reservation.new
    @reservation.donation = @donation
    @reservation.visit = @visit
    @reservation.status = "Pending"

    if @reservation.save
      redirect_to donation_path(@donation)
    else
      render :new
    end
    authorize @reservation
  end
  
  def show
  	@donation = Donation.find(params[:donation_id])
  	@reservation = Reservation.find(params[:id])
  	@reservation = @donation.reservation
  end

  def update
  	@donation = Donation.find(params[:donation_id])
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
