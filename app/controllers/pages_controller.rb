class PagesController < ApplicationController
  def home
  end

  def my_dashboard
    @user = current_user
    @my_offers = @user.flight_tickets
    #@my_purchases = @user.purchases
  end
end
