class Admins::OrdersController < Admins::Base
  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
    redirect_to admins_order_path(@order.id)
    flash[:notice] = "You have updated customer successfully."
    else
      render "edit"
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_price, :payment_method, :status)
  end
end
