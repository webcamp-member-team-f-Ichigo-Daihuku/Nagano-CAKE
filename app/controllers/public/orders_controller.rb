class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_public.adresses.all
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
    @order = current_public.orders
  end

  def show
  end
end
