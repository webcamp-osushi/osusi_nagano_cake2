class Admins::CustomersController < Admins::Base
  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
    flash[:notice] = "You have updated customer successfully."
    else
      render "edit"
    end
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password, :address, :postal_code, :telephone_number, :is_deleted)
  end

end
