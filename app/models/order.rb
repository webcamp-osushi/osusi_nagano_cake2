class Order < ApplicationRecord

	enum _method: { card: 0, cash: 1 }
	enum status: { nyukin: 0, kakunin: 1, seisaku: 2, hassouzyunbi: 3, hassou: 4 }
	
	has_many :order_deatails, dependent: :destroy
	belongs_to :customer

	# 小計
	def subtotal_price
		price * carts.amount
	end
	


	# def all_address
	# 	Customer.postal_cord + Customer.address
 #    end
end
