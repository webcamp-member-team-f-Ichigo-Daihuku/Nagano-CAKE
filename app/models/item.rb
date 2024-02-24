class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_one_attached :item_image

  def get_item_image(width, height)
  unless item_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    item_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def remaining_amount
    cart_items_amount = self.cart_items.sum(:amount)
    remaining_amount = 10 - cart_items_amount
    remaining_amount > 0 ? remaining_amount : 0
  end

  def with_tax_price
    (price * 1.1).floor.to_i
  end
end