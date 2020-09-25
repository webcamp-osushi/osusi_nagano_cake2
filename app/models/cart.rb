class Cart < ApplicationRecord

	belongs_to :customer
	belongs_to :product
	validates :amount, presence: true
	
	def subtotal_price
		product.price * amount
	end
end
