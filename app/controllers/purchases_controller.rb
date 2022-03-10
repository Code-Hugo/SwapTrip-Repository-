class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
    @user = current_user
    @flight_ticket = FlightTicket.find(params[:flight_ticket_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @user = current_user
    if @purchase.save!
      redirect_to my_dashboard_path(@user)
    else
      render :new
    end
  end

  private

  def purchase_params
    params.permit(:user_id, :flight_ticket_id)
  end
end
