class Admin::HomesController < ApplicationController
  
  def top
    @orders = Order.page(params[:page])
    @order = Order.find(params[:id])
     
  end
end
