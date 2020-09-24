class OrderDetail < ApplicationRecord


	belongs_to :product
	belongs_to :order
  enum status:{ 
    impossible: 0,
    waiting: 1,
    making: 2,
    finish: 3
  }, _prefix: true
  # 小計
  def subtotal_price
		price * amount * 1.08
	end

end
