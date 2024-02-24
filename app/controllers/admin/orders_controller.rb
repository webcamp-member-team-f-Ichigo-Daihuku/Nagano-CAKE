class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
  @order = Order.find(params[:id])
  if @order.update(order_params)
    if @order.status == "confirm_payment"
      @order.order_details.each do |order_detail|
        order_detail.update(making_status: "waiting_manufacture")
      end
    end
    flash[:notice] = "更新しました♪"
    redirect_to request.referer
  else
    render request.referer
  end
end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end