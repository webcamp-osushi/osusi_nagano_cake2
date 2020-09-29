class OrderDetail < ApplicationRecord


	belongs_to :product
	belongs_to :order
  enum making_status:{ 
    着手不可: 0,
    製作待ち: 1,
    製作中: 2,
    製作完了: 3
  }, _prefix: true

  # 小計
  def subtotal_price
		BigDecimal(price) * amount * BigDecimal("1.08")
	end

end
