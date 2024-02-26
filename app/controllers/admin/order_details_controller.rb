class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == "manufacturing"
         @order = @order_detail.order
         @order.update(status: "making")
      end
      flash[:notice] = "更新しました♪"
      if @order_detail.making_status == "finish"
         @order = @order_detail.order
        if @order.order_details.all? { |order_detail| order_detail.making_status == "finish" }
           @order.update(status: "finish_prepare")
        end
        flash[:notice] = "更新しました♪"
        redirect_to request.referer
      else
        redirect_to request.referer
      end
    end
  end

  private
    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end
end