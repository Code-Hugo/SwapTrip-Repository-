class ApplicationController < ActionController::Base
    def after_sign_in_path_for(user)
        new_flight_ticket_path
    end
end

