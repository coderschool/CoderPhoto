class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  around_filter :user_time_zone, if: :current_user

  private
  def set_locale
    # other ways to set locale
    # current_user.locale
    # request.subdomain
    # request.env["HTTP_ACCEPT_LANGUAGE"]
    # request.remote_ip
    if params[:locale]
      I18n.locale = params[:locale]
    else
      I18n.locale = current_user.language
    end
  end

  private
  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
    # similarly:
    # Time.use_zone(current_user.time_zone) { yield }
  end
end
