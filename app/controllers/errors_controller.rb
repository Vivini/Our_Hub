# encoding: utf-8

class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :auth_visit

  def not_found
    respond_to do |format|
      format.html { render status: 404 }
    end
  end

  def unacceptable
    respond_to do |format|
      format.html { render status: 422 }
    end
  end

  def internal_error
    respond_to do |format|
      format.html { render status: 500 }
    end
  end
end