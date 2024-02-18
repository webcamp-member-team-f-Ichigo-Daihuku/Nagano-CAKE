class Public::PublicersController < ApplicationController
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
      redirect_to public_publicer_path(@publicer.id)
    else
      render :edit
    end
  end

  def check
    # @publicer = Public.find(params[:id])
  end

  def withdraw
    # @publicer = Public.find(current_Public.id)
    @publicer = Public.find(current_public.id)
    # is_activeカラムをfalseに変更することにより削除フラグを立てる
    @publicer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def publicer_params
    params.require(:public).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end

end
