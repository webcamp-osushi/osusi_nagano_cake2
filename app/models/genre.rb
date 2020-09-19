class Genre < ApplicationRecord
	has_many :products, dependent: :destroy

	validates :name, presence: true
	validates :is_active, acceptance: true
end
