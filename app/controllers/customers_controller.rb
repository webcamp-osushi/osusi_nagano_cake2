class CustomersController < ApplicationController

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)  
  end

  def confirm
    @customer = Customer.find(params[:id])
   
end

#仮リダイレクト用、後で消す
def index
end

def check
  @customer = Customer.find(paramas[id])
end
#リダイレクト先は後でproduct#topに変更
def leave
	@customer = Customer.find(params[:id])

	@customer.update(is_deleted: "Available")
   
    reset_session
   
    redirect_to products_path
end



  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password, :address, :postal_cord, :telephone_number, :is_deleted)
    
end
end