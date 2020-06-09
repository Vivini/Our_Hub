class DonationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :index ]
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  def index
    @donations = policy_scope(Donation).all 
    if params[:categories].present?
      @donations = @donations.joins(:categories).where("categories.id =?", "#{params[:categories]}")
    end
    if params[:address].present?
      @donations= @donations.near(params[:address], 100)
    end
    if params[:query].present?
      sql_query = " \
        donations.name ILIKE :query \
        OR donations.description ILIKE :query \
        OR categories.name ILIKE :query \
      "
      @donations = @donations.joins(:categories).where(sql_query, query: "%#{params[:query]}%")
    end
    #@donations = policy_scope(Donation)
    #@donations = Donation.geocoded # returns donations with coordinates
    @markers = @donations.geocoded.map do |donation|
      {
        lat: donation.latitude,
        lng: donation.longitude
      }
    end 
  end

  def create
    @donation = current_user.donations.create!(donation_params)
    if @donation.save
      redirect_to donations_path
    else
      render :new
    end
    authorize @donation
  end

  def show
    authorize @donation
  end

  def new
    @donation = Donation.new
    authorize @donation
  end

  def edit
    authorize @donation
  end

  def update
    if @donation.update(donation_params)
      redirect_to @donation, notice: "Donation was succesfully updated."
    else
      render :edit
    end
  end

  def destroy
    @donation.destroy
    redirect_to user_path(:id), notice: "Donation was succesfully deleted."
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
