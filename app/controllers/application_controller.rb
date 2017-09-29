class ApplicationController < ActionController::Base
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
# before_filter :configure_permitted_parameters, if: :devise_registrations_controller?
  # protected
  # def configure_permitted_parameters
  #   puts params[:ip]=request.remote_ip.to_s
  #   puts "hahahah"
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute,:username,:ip])
  # end
end
