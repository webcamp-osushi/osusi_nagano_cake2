class Customers::CustomersController < Customers::Base

	def show
		@customer = current_customer

	end

	private
    def customer_params
 	    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_cord, :telephone_number)
    end
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

