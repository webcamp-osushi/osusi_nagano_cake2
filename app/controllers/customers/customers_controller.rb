class Customers::CustomersController < Customers::Base

	def show
		@customer = current_customer

	end

# def confirm
#     @customer = Customer.find(params[:id])
   
# end

# def leave
# 	@customer = Customer.find(current_customer.id)

# 	@customer.update(is_active: "Invalid")

#     reset_session

#     redirect_to root_path
#     #root_pathへのリダイレクトでいいか要確認


# end

