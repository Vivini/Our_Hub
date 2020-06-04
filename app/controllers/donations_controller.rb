class DonationsController < ApplicationController

  def index
  @donations = Donation.geocoded # returns donations with coordinates
  @markers = @donations.map do |donation|
      {
        lat: donation.latitude,
        lng: donation.longitude
        infoWindow: render_to_string(partial: "info_window", locals: { donation: donation }) 
      }
    end
    
  def donation_params
    params.require(:donation).permit(photos: [])
  end
end
