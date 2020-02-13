class Admins::HomesController < ApplicationController
  def top
  	  	@order_count = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def about
  end
end
