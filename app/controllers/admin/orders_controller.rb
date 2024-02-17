class Admin::OrdersController < ApplicationController
 def index
    @orders = Oder.page(params[:page])
     @order = Order.find(params[:id])
     
 end


  def show
     @order = Order.find(params[:id])
      @order_details= OrderDetail.where(order_id: @order.id)
  end
end

