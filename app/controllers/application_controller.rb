class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_locale

  def after_sign_in_path_for(resource)
    if resource.confirmed?
      user_path(resource)
    else
      flash[:notice] = "Please confirm your email before continuing."
      new_user_session_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
