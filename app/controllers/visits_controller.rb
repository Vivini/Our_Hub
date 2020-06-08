class VisitsController < ApplicationController\

  def new
    if cookies.encrypted[:token].present?
      redirect_to donations_path
    else
      @visit = Visit.new
    end
  end

  def create
    token = SecureRandom.hex(8)
    cookies.encrypted[:token] = token
    @visit = Visit.new(token: token)

    if @visit.save
      redirect_to donations_path
    else
      render :new
    end
  end

  def destroy
  end
end
