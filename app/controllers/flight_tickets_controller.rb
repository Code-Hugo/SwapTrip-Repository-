class FlightTicketsController < ApplicationController
before_action :set_ticket, only:[:show, :edit, :update, :status]

  def index
    if params[:departure].present? && params[:arrival].present? && params[:departure_at].present? && params[:arrival_at].present?
      @departure = Airport.find_by_city(params[:departure].capitalize)
      @arrival = Airport.find_by_city(params[:arrival].capitalize)
      @departure_at = DateTime.parse(params[:departure_at])..DateTime.parse(params[:departure_at]) + 24.hour
      @arrival_at = DateTime.parse(params[:arrival_at])..DateTime.parse(params[:arrival_at]) + 24.hour
      @flight_tickets = FlightTicket.where(departure: @departure, arrival: @arrival, departure_at: @departure_at, arrival_at: @arrival_at)
    elsif params[:departure].present? && params[:arrival].present?
      @departure = Airport.find_by_city(params[:departure].capitalize)
      @arrival = Airport.find_by_city(params[:arrival].capitalize)
      @flight_tickets = FlightTicket.where(departure: @departure, arrival: @arrival)
    elsif params[:departure].present? && params[:departure_at].present?
      @departure = Airport.find_by_city(params[:departure].capitalize)
      @departure_at = DateTime.parse(params[:departure_at])..DateTime.parse(params[:departure_at]) + 24.hour
      @flight_tickets = FlightTicket.where(departure: @departure, departure_at: @departure_at)
    elsif params[:departure].present? && params[:arrival].present? && params[:departure_at].present?
      @departure = Airport.find_by_city(params[:departure].capitalize)
      @arrival = Airport.find_by_city(params[:arrival].capitalize)
      @departure_at = DateTime.parse(params[:departure_at])..DateTime.parse(params[:departure_at]) + 24.hour
      @flight_tickets = FlightTicket.where(departure: @departure, arrival: @arrival, departure_at: @departure_at)
    elsif params[:departure].present?
      @departure = Airport.find_by_city(params[:departure].capitalize)
      @flight_tickets = FlightTicket.where(departure: @departure)
    elsif params[:arrival].present?
      @arrival = Airport.find_by_city(params[:arrival].capitalize)
      @flight_tickets = FlightTicket.where(arrival: @arrival)
    elsif params[:departure_at].present?
      @departure_at = DateTime.parse(params[:departure_at])..DateTime.parse(params[:departure_at]) + 24.hour
      @flight_tickets = FlightTicket.where(departure_at: @departure_at)
    elsif params[:arrival_at].present?
      @arrival_at = DateTime.parse(params[:arrival_at])..DateTime.parse(params[:arrival_at]) + 24.hour
      @flight_tickets = FlightTicket.where(arrival_at: @arrival_at)
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
    @flight_ticket.user_id = current_user.id
    if @flight_ticket.save!
      redirect_to edit_flight_ticket_path(@flight_ticket)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flight_ticket.update(ticket_params)
    redirect_to flight_ticket_path(@flight_ticket)
  end

  def status

  end

  private
  def ticket_params
    params.require(:flight_ticket).permit(:confirmation_id, :ticket_number, :airline_code, :confirmation_code, :flight_number, :price, :departure_id, :arrival_id, :departure_at, :arrival_at, :user_id)
  end

  def set_ticket
    @flight_ticket = FlightTicket.find(params[:id])
  end
end
