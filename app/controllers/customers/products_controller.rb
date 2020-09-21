class Customers::ProductsController < Customers::Base

	def top
		@genres = Genre.where(is_active: true)
	end

	def about
	end

	def index
		@genres = Genre.where(is_active: true)

		if params[:genre_id]
			@genre = Genre.find(params[:genre_id])
			@products = @genre.products.order(created_at: :desc)
			@products_count = @genre.products.count
		else
			@products = Product.order(created_at: :desc)
      		@products_count = Product.count
      	end

	end

	def show
		@genres = Genre.where(is_active: true)
		@product = Product.find(params[:id])
    	@cart = Cart.new
	end

end
