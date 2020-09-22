class OrderDetail < ApplicationRecord

	has_many :products, dependent: :destroy
	belongs_to :order
end
