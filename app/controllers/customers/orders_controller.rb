class Customers::OrdersController < Customers::Base

	def new
		@order = Order.new
		@customer = current_customer
	end

	def confirm
		@order = Order.new(order_params)
		@order.shipping_cost = 800
		# カート内合計金額。cartコントローラー,indexアクションより引用
		@order.total_price = 0
	    @cart = Cart.where(customer_id: current_customer.id)
		@cart.each do |cart|
			@order.total_price += ((BigDecimal(cart.product.price) * BigDecimal("1.08") * cart.amount).ceil)
		# カート内合計金額終わり
		end

		case params[:address_select] #選択肢したaddressによって条件分岐
		when "ご自身の住所"
			@order.postal_code = current_customer.postal_cord
			@order.address = current_customer.address
			@order.name = current_customer.last_name + current_customer.first_name
		when "登録済み住所から選択"
			@order.postal_code = Address.find(set_delivery[:id]).postal_code
			@order.address = Address.find(set_delivery[:id]).address
			@order.name = Address.find(set_delivery[:id]).name
		when  "新しいお届け先"
		end
	end

	def create
		@order = Order.new(order_params)
		@order.save
		# order_detailテーブルにも保存
		current_customer.carts.each do |cart|
			@order_detail = OrderDetail.new(
				product_id: cart.product.id,
				amount: cart.amount,
				price: cart.product.price,
				order_id: @order.id )
			@order_detail.save
		end
		# 新しいアドレスを配送先に保存
		@address_select = params[:address_select]
		if @address_select == "新しいお届け先"
			@address = Address.new(
				customer_id: current_user_id,
				postal_code: @order.postcode,
				address: @order.address,
				name: @order.name )
			@address.save
		end
		current_customer.carts.destroy_all
		redirect_to thanks_customers_orders_path
	end

	def index
	end

	def show
	end

	def thanks
	end



	private

	def order_params
		params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_price, :_method)
	end
end
