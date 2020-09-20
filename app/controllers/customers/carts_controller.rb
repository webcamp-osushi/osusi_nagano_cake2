class Customers::CartsController < Customers::Base
	before_action :authenticate_customer!

	def index
	end

end
