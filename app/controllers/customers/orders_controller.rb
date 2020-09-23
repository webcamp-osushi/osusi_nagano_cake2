class Customers::OrdersController < Customers::Base

	def new
		@order = Order.new
		@customer = current_customer
	end

	def confirm
		@order = Order.new
		@orders = Order.all
		@order.shipping_cost = 800
		# カート内合計金額。cartコントローラー,indexアクションより引用
		@total_price = 0
	    @cart = Cart.where(customer_id: current_customer.id)
		@cart.each do |cart|
			@total_price += ((BigDecimal(cart.product.price) * BigDecimal("1.08") * cart.amount).ceil)
		# カート内合計金額終わり
		end

		case params[:address] #選択肢したaddressによって条件分岐
		when "ご自身の住所"
			@order.postal_code = current_customer.postal_code
			@order.address = current_customer.address
			@order.name = current_customer.last_name + current_customer.firstname
		when "登録済み住所から選択"
			@order.postal_code = Address.find(set_delivery[:id]).postal_code
			@order.address = Address.find(set_delivery[:id]).address
			@order.name = Address.find(set_delivery[:id]).name
		when  "新しいお届け先"
		end
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
