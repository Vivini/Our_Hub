class DonationsController < ApplicationController

  before_action :set_white_navbar, only: [:index]
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  def index
    @donations = Donation.all
    @donations = policy_scope(Donation)
    @donations = Donation.geocoded # returns donations with coordinates
    @markers = @donations.map do |donation|
      {
        lat: donation.latitude,
        lng: donation.longitude
      }
    end
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      redirect_to donations_path
    else
      redirect_to donations_path
    end
    authorize @donation
  end

  def show
    authorize @donation
  end

  def new
    @donation = current_user.donations.new
    authorize @donation
  end

  def edit
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
    authorize @donation
  end

  def donation_params
    params.require(:donation).permit(:name, :address, :description, :longitude, :latitude, :timeframe, :photo)
  end
end
