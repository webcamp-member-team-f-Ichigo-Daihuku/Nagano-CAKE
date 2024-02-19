class Admin::HomesController < ApplicationController
  
  def top
    @orders = Oder.page(params[:page])
    @order = Order.find(params[:id])
     
  end
end
