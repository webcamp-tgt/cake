class Item < ApplicationRecord
	has_many :favorites, dependent: :destroy
    attachment :image
end
