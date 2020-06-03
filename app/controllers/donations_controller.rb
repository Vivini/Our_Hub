class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  def index
    @donations = policy_scope(Donation)
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

  def create
    @donation = current_user.donations.new(donation_params)
    authorize @donation
    if @donation.save
      redirect_to @donation
    else
      render :edit
    end
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
    authorize @donation
  end
end
