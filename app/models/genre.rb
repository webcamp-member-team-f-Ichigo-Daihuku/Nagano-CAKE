class Genre < ApplicationRecord
  has_many :items
  paginates_per 10
end
