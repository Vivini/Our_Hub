class DonationsController < ApplicationController
<<<<<<< HEAD
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  def index
    @donations = Donation.all
  end

  def show
  end

  def new
    @donation = Donation.new
  end

  def create
    
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(photos: [])
  end
end

