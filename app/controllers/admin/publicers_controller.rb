class Admin::PublicersController < ApplicationController
  def index
    @publicers = Public.page(params[:page])
  end

  def show
    @publicer = Public.find(params[:id])
  end

  def edit
    @publicer = Public.find(params[:id])
  end

  def update
    @publicer = Public.find(params[:id])
    if @publicer.update(publicer_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to admin_publicer_path(@publicer.id)
    else
      render :edit
    end
  end

  private

  def publicer_params
    params.require(:public).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

end
