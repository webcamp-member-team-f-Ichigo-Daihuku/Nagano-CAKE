class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { impossible_manufacture: 0, waiting_manufacture: 1, manufacturing: 2, finish: 3 }

before_create :set_default_making_status

private

def set_default_making_status
  self.making_status = :impossible_manufacture
end
end
