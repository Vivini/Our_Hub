class DonationsController < ApplicationController
  def donation_params
    params.require(:donation).permit(:photo)
  end
end
