class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @reservations = policy_scope(Reservation).where(visit: @visit)

    @donations = @reservations.map do |reservation|
      reservation.donation
    end.uniq

      @markers = @donations.map do |donation|
      {
        lat: donation.latitude,
        lng: donation.longitude
      }
    end
  end

  def new

    @donation = Donation.new
    @reservation = Reservation.new
    authorize @reservation

  end

  def create
    @donation = Donation.find(params[:donation_id])
    @reservation = Reservation.new
    @reservation.donation = @donation
    @reservation.visit = @visit
    @reservation.status = "Reserved"

    if @reservation.save
      redirect_to donation_reservations_path(@donation)
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
  	@reservation.status = "Reserved"
    @reservation.save!
    # ?? Change to ""
    redirect_to donation_path(@donation)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to root_path
  end

  #private

  # def reservation_params
  #   params.require(:reservation).permit(:status)
  # end
end
