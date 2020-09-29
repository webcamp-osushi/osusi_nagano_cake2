class Cart < ApplicationRecord

	belongs_to :customer
	belongs_to :product
	validates :amount, presence: true
	
	def subtotal_price
		BigDecimal(product.price) * amount
	end
end
