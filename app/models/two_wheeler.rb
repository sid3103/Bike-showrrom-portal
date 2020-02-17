class TwoWheeler < ApplicationRecord
	has_one :cart
	has_many :cart_items
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
