class Address < ApplicationRecord
 belongs_to :public
 validates :address, presence: true
end
