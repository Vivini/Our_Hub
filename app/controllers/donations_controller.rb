class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end
end