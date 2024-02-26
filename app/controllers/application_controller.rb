class ApplicationController < ActionController::Base
  before_action :authenticate_public!, except: [:top,:about,:new,:index,:create,:show,:edit,:update]
  # skip_before_action :authenticate_public!, only: [:index,:show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   public_publicer_path(current_public.id)
  # end

  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  # end

end
