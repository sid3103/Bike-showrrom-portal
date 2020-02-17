 class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :two_wheeler
end
