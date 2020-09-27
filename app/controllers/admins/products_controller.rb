class Admins::ProductsController < Admins::Base
	def top
		# today = Date.todayじゃだめ？
		today = Date.today.beginning_of_day..Date.today.end_of_day #今日の０時から23時59分を取得
		@orders = Order.where(created_at: today)
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admins_product_path(@product.id)
	    else
	    	render "new"
	    end
	end

	def index
		@products = Product.includes(:genre)
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admins_product_path(@product)
		else
			render "edit"
		end
	end


	private
	def product_params
		params.require(:product).permit(:name, :introduction, :price, :image, :is_active, :genre_id)
	end
end
