class DonationsController < ApplicationController
  def donation_params
    params.require(:donation).permit(photos: [])
  end
end
