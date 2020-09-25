class Customers::CartsController < Customers::Base
	before_action :authenticate_customer!

	def index
		@cart = Cart.where(customer_id: current_customer.id)
		@total_price = 0
		@cart.each do |cart|
			@total_price += ((BigDecimal(cart.product.price) * BigDecimal("1.08") * cart.amount).ceil)
		end

	end

	def create
		@cart = Cart.new(cart_params)
		@cart.customer_id = current_customer.id
		if @cart.save
			redirect_to customers_carts_path
		else
			@producr = Product.find(cart.product.id)
			redirect_to customers_product_path(@product)
		end

	end

	def update
		@cart = Cart.where(customer_id: current_customer.id)
		@cart.find(params[:id]).update(cart_params)
		redirect_to customers_carts_path
	end

	def destroy
		@cart = Cart.where(customer_id: current_customer.id)
		@cart.find(params[:id]).destroy
		redirect_to customers_carts_path
	end

	def destroy_all
		@cart = Cart.where(customer_id: current_customer.id)
		@cart.destroy_all
		redirect_to customers_carts_path

	end

	private

	def cart_params
		params.require(:cart).permit(:amount, :price, :customer_id, :product_id)
	end


end
