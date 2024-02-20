class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @totle = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
    redirect_to cart_items_path
    else
    render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end


  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.public_id = current_public.id
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      render :index
    else
      @cart_item.save
      render :index
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :public_id, :amount)
  end
end
