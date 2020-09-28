class Admins::CustomersController < Admins::Base

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if params[:customer][:is_deleted]
       @customer.update(is_deleted: params[:customer][:is_deleted])
       redirect_to admins_customers_path
    elsif @customer.update(customer_params)
      flash[:notice] = "You have updated customer successfully."
      redirect_to admins_customers_path
    else
      render "edit"
    end
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password, :address, :postal_code, :telephone_number)
  end


end
