class Order < ApplicationRecord
  belongs_to :public
  has_many :cart_items
  enum payment_method: { credit_card: 0, transfer: 1 }
# 　enum order_status: { wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4 }
# 　enum order_status: [ :wait_payment, :confirm_payment, :making, :preparing_ship, :finish_prepare ]

end
