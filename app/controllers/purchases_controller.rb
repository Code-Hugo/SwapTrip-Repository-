class PurchasesController < ApplicationController

  def show
    @purchase = Purchase.find(params[:id])
    #console
    @flight_ticket = @purchase.flight_ticket
    #@user = current_user
    #@flight_ticket = FlightTicket.find(params[:flight_ticket_id])
     @arrival = @flight_ticket.arrival
  end
  def new
    @purchase = Purchase.new
    @user = current_user
    @flight_ticket = FlightTicket.find(params[:flight_ticket_id])
    @arrival = @flight_ticket.arrival
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @user = current_user
    if @purchase.save!
      redirect_to purchase_path(@purchase)
    else
      render :new
    end
  end

  private

  def purchase_params
    params.permit(:user_id, :flight_ticket_id)
  end
end
