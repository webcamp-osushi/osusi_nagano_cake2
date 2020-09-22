class Customers::OrdersController < Customers::Base
	def new
		@order = Order.new
		@customer = current_customer
	end

	def confirm

	end

	def create
	end

	def index
	end

	def show
	end

	def thanks
	end

	private

	def order_params
		params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_price, :_method, :status)
	end
end
