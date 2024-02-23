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
    @addresss = Address.new(address_params)
    @address.public_id = current_public.id
    @address.save
    redirect_to public_addresses_path
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
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
    params.require(:addresses).permit(:address, :postal_code, :name)
  end

end
