class FlightTicketsController < ApplicationController

  before_action :set_ticket, only:[:show]

    def index
        if params[:departure].present?
          @departure = Airport.find_by_city(params[:departure].capitalize)
          @flight_tickets = FlightTicket.where(departure: @departure)
        else
          @flight_tickets = FlightTicket.all
        end
      end

    def show
      @user = current_user
    end

    def new
        @flight_ticket = FlightTicket.new
        @airports = Airport.order(:city)
    end

    def create
      @flight_ticket = FlightTicket.new(ticket_params)
      if @flight_ticket.save!
        redirect_to flight_ticket_path(@flight_ticket)
      else
        raise
        render :new
      end
    end

    private
    def ticket_params
        params.require(:flight_ticket).permit(:confirmation_id, :ticket_number, :airline_code, :flight_number, :price, :departure_id, :arrival_id, :departure_at, :arrival_at, :user_id)
    end

      def set_ticket
        @flight_ticket = FlightTicket.find(params[:id])
      end
end
