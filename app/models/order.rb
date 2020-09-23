class Order < ApplicationRecord


	enum _method: { card: 0, cash: 1 }
	has_many :order_deatails, dependent: :destroy
	belongs_to :customer

	# 小計
	def subtotal_price
		price * carts.amount
	end



	# def all_address
	# 	Customer.postal_cord + Customer.address
 #    end

  enum status:{ 
    waiting: 0,
    confirm: 1,
    making: 2,
    preparing: 3,
    shipping: 4
  }, _prefix:true
  #waiting=入金待ち、confirm=入金確認、making=製作中、preparing=発送準備中、shipping=発送済み

end
