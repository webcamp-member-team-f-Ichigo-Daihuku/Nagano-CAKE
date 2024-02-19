# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_public, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
    public_publicer_path(current_public.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def reject_public
    @publicer = Public.find_by(email: params[:publics][:email])
    if @publicer
      if @publicer.valid_password?(params[:publics][:password]) && (@publicer.is_active == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_public_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    else
      flash[:notice] = "該当するユーザーが見つかりません"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # private
  # # アクティブであるかを判断するメソッド
  # def publicer_state
  # # 【処理内容1】 入力されたemailからアカウントを1件取得
  # publicer = Publicer.find_by(email: params[:publicer][:email])
  # # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
  # return if publicer.nil?
  # # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
  # return unless publicer.valid_password?(params[:publicer][:password])
  # # 【処理内容4】 アクティブでない会員に対する処理
  # return if is_active.ture?
  # else
  #   redirect_to new_public_registration_path
  # end
end
