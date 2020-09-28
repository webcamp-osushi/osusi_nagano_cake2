class Order < ApplicationRecord


	enum _method: { クレジットカード: 0, 銀行振込: 1 }
	has_many :order_details, dependent: :destroy
	belongs_to :customer

	


	# 商品合計
	def product_sum_price
		total = 0
		order_details.each do |order_detail|
			total += order_detail.subtotal_price
		end
	 total
	end


  enum status:{
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備: 3,
    発送済み: 4
  }
  #waiting=入金待ち、confirm=入金確認、making=製作中、preparing=発送準備中、shipping=発送済み

end
