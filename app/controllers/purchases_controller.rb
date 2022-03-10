class PurchasesController < ApplicationController
    def new
        @purchase = Purchase.new
        @user = current_user
        @flight_ticket = FlightTicket.find(params[:flight_ticket_id])
      end
end
