class Customers::CustomersController < Customers::Base

	
def update
  	@user = User.find(params[:id])
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

# private

# def customer_params
# 	params.require(:customer).permit(:active)
# end