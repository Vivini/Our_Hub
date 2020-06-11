class UsersController < ApplicationController
  def index
  @users = User.geocoded # returns users (organizations) with coordinates
  @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def show
    @user = current_user
    authorize @user
  end
end

