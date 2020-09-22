class Product < ApplicationRecord

	attachment :image
	belongs_to :genre
	belongs_to :order_detail

	validates :name, :introduction, presence: true
	validates :price, numericality: true
	validates :is_active, inclusion: { in: [true, false] }
	validates :genre_id, exclusion: { in: %w(nill) }

	# 税込価格
	def tax_in_price
		price * 1.1
	end

end
