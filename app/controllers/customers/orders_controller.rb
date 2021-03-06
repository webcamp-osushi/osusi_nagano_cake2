class Customers::OrdersController < Customers::Base

	def new
		@carts = Cart.where(customer_id: current_customer.id)
		if @carts.empty?
			redirect_to customers_carts_path, alert: 'カートが空です'
		else
		@order = Order.new
		@customer = current_customer
		@addresses = Address.where(customer_id: @customer.id)
	    end
	end

	def confirm
		@order = current_customer.orders.build(order_params)
		@order.shipping_cost = 800
		# カート内合計金額。cartコントローラー,indexアクションより引用
		@order.total_price = 0
	    @cart = Cart.where(customer_id: current_customer.id)
		@cart.each do |cart|
			@order.total_price += ((BigDecimal(cart.product.price) * BigDecimal("1.08")).ceil) * cart.amount
		# カート内合計金額終わり
		end
		#2000円以上で送料無料
		if @order.total_price >= 2000
			@order.shipping_cost = 0
		end

		case params[:address_select] #選択肢したaddressによって条件分岐
		when "ご自身の住所"
			@order.postal_code = current_customer.postal_cord
			@order.address = current_customer.address
			@order.name = current_customer.last_name + current_customer.first_name
		when "登録済み住所から選択"
			@customer_address =Address.find(params[:address][:id])
			@order.postal_code = @customer_address.postal_code
			@order.address = @customer_address.address
			@order.name = @customer_address.name
		when  "新しいお届け先"
		end
	end

	def create
		@order = current_customer.orders.build(order_params) #newメソッドじゃうまくいかなかったためbuild使用
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
		 if params[:address_select] == "新しいお届け先" #ここが動いてない？
			 @address = Address.new()
			 @address.customer_id = current_customer.id
			 @address.postal_code = params[:order][:postal_code]
			 @address.address = params[:order][:address]
			 @address.name = params[:order][:name]
			 @address.save
		end
		current_customer.carts.destroy_all
		redirect_to thanks_customers_orders_path
	end

	def index
		@orders = current_customer.orders.order(id: "DESC")
	end

	def show
		@order = Order.find(params[:id])
		@order.shipping_cost = 800
	end

	def thanks
	end



	private

	def order_params
		params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_price, :_method)
	end
end
