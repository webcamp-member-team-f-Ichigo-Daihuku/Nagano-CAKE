class Admin::OrdersController < ApplicationController
  
  def index
    @order = current_public.orders
    
  end
end
