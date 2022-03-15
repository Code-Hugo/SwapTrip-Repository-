class RegistrationsController < Devise::RegistrationsController
  # def new
  #   super
  #   session[:from_popup] = params[:from_popup]
  # end

  # def create
  #   super
  #   if session[:from_popup]
  #     store_user_location!
  #     session.delete(:from_popup)
  #   end
  # end

  # private

  # def store_user_location!
  #   store_location_for(:user, root_path)
  # end
end
