class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  around_filter :set_time_zone, if: :current_user

  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def set_time_zone(&block)
    if current_user.time_zone.present?
      Time.use_zone(current_user.time_zone, &block)
    end
  end
end
