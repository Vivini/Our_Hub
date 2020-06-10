class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :auth_visit
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:root, :index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  def set_white_navbar
    @white_navbar = true
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def auth_visit
    if Visit.find_by(token: cookies.encrypted[:token])
      @visit = Visit.find_by(token: cookies.encrypted[:token])
    else
      token = SecureRandom.hex(8)
      cookies.encrypted[:token] = token
      @visit = Visit.create(token: token)
    end
  end
end
