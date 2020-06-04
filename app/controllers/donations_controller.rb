class DonationsController < ApplicationController

  def index
  @donations = Donation.geocoded # returns donations with coordinates
  @markers = @donations.map do |donation|
      {
        lat: donation.latitude,
        lng: donation.longitude
      }
    end

  def donation_params
    params.require(:donation).permit(photos: [])
  end
end
