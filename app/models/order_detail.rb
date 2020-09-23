class OrderDetail < ApplicationRecord


	has_many :products, dependent: :destroy
	belongs_to :order
  enum status:{ 
    impossible: 0,
    waiting: 1,
    making: 2,
    finish: 3
  }, _prefix: true

end
