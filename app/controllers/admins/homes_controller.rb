class Admins::HomesController < ApplicationController
  def top
  	require "date"
  	@order = Order.all.today
  end

  def about
  end
end
