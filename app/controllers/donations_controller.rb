class DonationsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @donations = Donation.all
  end

  def show
  end

  private

  def set_donation
    @restaurant = Restaurant.find(params[:id])
  end
end