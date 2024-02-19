class Public::OrdersController < ApplicationController
   before_action :authenticate_public!, only: [:new, :confirm, :create, :index, :show, :thanks]

  def new
    @order = Order.new
    @addresses = current_public.adresses.all
  end

  def confirm
    @cart_items = CartItem.where(public_id: current_public.id)
    @shipping_cost = 800
    @selected_payment_method = params[:order][:pey_method]

    ary = []
    @cart_items.each do |cart_item|
      ary << cart_item.item.price*cart_item.amount
    end
    @cart_items_price = ary.sum

    @total_price = @shipping_cost + @cart_items_price
    @address_type = params[:order][:address_type]
    case @address_type
    when "public_address"
      @selected_address = current_public.postal_code + " " + current_public.address + " " + current_public.family_name + current_public.first_name
    when "registered_address"
      unless params [:order][:registered_address_id] == ""
        selected = Address.find(params[:order][:registered_address_id])
        @selected_address = selected.post_code + " " + selected.address + " " + selected.name
      else
        render :new
      end
    when "new_address"
      unless params[:order][:new_postal_code] == "" && params[:order][:new_address] == "" && params[:order][:new_name] == ""
        @selected_address = params[:order][:new_postal_code] + " " + params[:order][:new_address] + " " + params[:order][:new_name]
      else
        render :new
      end
    end
  end

  def thanks
  end

  def create
      @order = Order.new
      @order.public_id = current_public.id
      @order.shipping_cost = 800
      @cart_items = CartItem.where(public_id: current_public.id)
      ary = []
      @cart_items.each do |cart_item|
        ary << cart_item.item.price*cart_item.amount
      end
      @cart_items_price = ary.sum
      @order.total_price = @order.shipping_cost + @cart_items_price
      @order.payment_method = params[:order][:pay_method]
      if @order.payment_method == "credit_card"
        @order.status = 1
      else
        @order.status = 0
      end

      address_type = params[:order][:address_type]
      case address_type
      when "public_address"
      @order.post_code = current_public.post_code
      @order.address = current_public.address
      @order.name = current_public.family_name + current_public.first_name
      when "registered_address"
      selected = Address.find(params[:order][:registered_address_id])
      @order.postal_code = selected.postal_code
      @order.address = selected.address
      @order.name = selected.name
      when "new_address"
      @order.postal_code = params[:order][:new_postal_code]
      @order.address = params[:order][:new_address]
      @order.name = params[:order][:new_name]
      end

      if @order.save
        if @order.status == 0
          @cart_items.each do |cart_item|
            OrderDetail.create!(order_id: @order.id, item_id: cart_item.item.id, price: cart_item.item.price,amount: cart_item.amount, making_status: 0)
          end
        else
          @cart_items.each do |cart_item|
            OrderDetail.create!(order_id: @order.id, item_id: cart_item.item.id, price: cart_item.item.price, amount: cart_item.amount, making_status: 1)
          end
        end
        @cart_items.destroy_all
        redirect_to complete_orders_path
      else
        render :new
      end
<<<<<<< HEAD
  end
=======
  end

   def show
      @order = Order.find(params[:id])
      @order_details= OrderDetail.where(order_id: @order.id)
   end
>>>>>>> origin/develop
end