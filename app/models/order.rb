class Order < ApplicationRecord


	enum _method: { card: 0, cash: 1 }
	has_many :order_details, dependent: :destroy
	belongs_to :customer


	# 商品合計
	def product_sum_price
		total = 0
		order_details.each do |order_detail|
			total += order_detail.subtotal_price
		end
	 (total * 1.08).ceil
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
