class Product < ApplicationRecord

	attachment :image
	belongs_to :genre

	validates :name, :introduction, presence: true
	validates :price, numericality: true
	validates :is_active, inclusion: { in: [true, false] }
	validates :genre_id, exclusion: { in: %w(nill) }

end
