class VisitsController < ApplicationController
  
  def new
    if cookies.encrypted[:token].present?
      redirect_to donations_path
    else
      @visit = Visit.new
    end
  end

  def destroy
  end
end
