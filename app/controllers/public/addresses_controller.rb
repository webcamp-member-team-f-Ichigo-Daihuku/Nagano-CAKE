class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
    render 'edit'
  end

  def create
    @address = Address.new(addresses_params)
    @address.public_id = current_public.id

    if @address.save
    redirect_to public_addresses_path
    else
    @addresses = Address.all
    # エラーハンドリングの処理を追加する場合はここに記述する
    render :index
    end

  end

  def update
    @address = Address.find(params[:id])
    if @address.update(addresses_params)
      redirect_to public_addresses_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
  end

  private

  def addresses_params
    params.require(:address).permit(:address, :postal_code, :name)
  end

end
