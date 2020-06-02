class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all 
  end 

  def new
    @reservation = Reservation.find(params[:donation_id])
    


end
