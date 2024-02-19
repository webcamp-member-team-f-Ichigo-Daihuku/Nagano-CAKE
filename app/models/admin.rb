class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # def customer_status
  #   if is_deleted == true
  #     "退会"
  #   else
  #     "有効"
  #   end
  # end
  
  
end
