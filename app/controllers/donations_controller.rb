class DonationsController < ApplicationController

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
    authorize @donation
    @donation = Donation.new(donation_params)
    if @donation.save
      redirect_to donation_path(@donation)
    else
      render :new
   end
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
    params.require(:donation).permit(:name, :address, :description, :longitude, :latitude, :timeframe, photos: [])
  end
end

