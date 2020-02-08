class Item < ApplicationRecord
<<<<<<< HEAD
	belongs_to :genre
	has_many :cart_items,dependent: :destroy
	has_many :order_items,dependent: :destroy
=======
	has_many :favorites, dependent: :destroy
    attachment :image
>>>>>>> 23ef60466e03e496b301d3e6b5dbe867e2f533fa
end
