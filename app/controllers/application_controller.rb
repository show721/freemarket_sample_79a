class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name_kanji,:first_name_kanji,:last_name_kana,:first_name_kana,:birthday,:phone_number])
  end

end
