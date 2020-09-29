class Customers::AddressesController < Customers::Base
	before_action :authenticate_customer!

	def index
		@address = Address.new
		@addresses = Address.where(customer_id: current_customer.id)
	end

	def create
		@address = Address.new(address_params)
		@address.customer_id = current_customer.id
		if @address.save
			redirect_to customers_addresses_path
		else
			@addresses = Address.where(customer_id: current_customer.id)
			render :index
		end
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		if @address.update(address_params)
			redirect_to customers_addresses_path
		else
			render :edit
		end
	end

	def destroy
		@address = Address.find(params[:id])
		if @address.destroy
			redirect_to customers_addresses_path
		end
	end

	private
	def address_params
		params.require(:address).permit(:postal_code, :name, :address, :customer_id)
	end


end
