class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
    @items_count = Item.count
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item =CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :item_image)
  end
end
