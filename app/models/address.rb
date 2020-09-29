class Address < ApplicationRecord
	belongs_to :customer

	validates :postal_code, presence: true
	validates :address, presence: true
	validates :name , presence: true

	# 住所をまとめる
	def full_address
		self.postal_code + " " + self.address + " " + self.name
	end

end
