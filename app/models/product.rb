class Product < ApplicationRecord
  
	has_many :carts
	has_many :order_details
	belongs_to :genre
	belongs_to :order_detail

	attachment :image

	# 税込価格
	def tax_in_price
		price * 1.1
	end


	validates :is_active, inclusion: { in:[true, false]}
	validates :genre, presence: true
  	validates :name, presence: true
  	validates :introduction, presence: true
  	validates :price, presence: true, numericality: {only_integer: true}
  	validates :genre_id, exclusion: { in: %w(nill) }

end
