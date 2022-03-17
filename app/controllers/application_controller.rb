class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :store_user_location!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:Fullname, :address, :username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:Fullname, :address, :username])
  end

  def default_url_options
  { host: ENV["www.swaptrip.herokuapp.com/"] || "localhost:3000" }
  end

    def after_sign_in_path_for(user)
        new_flight_ticket_path
    end

    # private

    # def store_user_location!
    #   request.fullpath
    # end
end
