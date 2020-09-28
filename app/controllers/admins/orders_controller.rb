class Admins::OrdersController < Admins::Base
  def index
    @orders = Order.all
  end
  def edit
    @order = Order.find(params[:id])
  end
  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    if params[:order][:status] == "入金待ち"
      @order.update(status: 0)
      @order_detail.update(making_status: 0)
    redirect_to admins_orders_path
    elsif params[:order][:status] == "入金確認"
      @order.update(status: 1)
      @order_detail.update(making_status: 1)
    redirect_to admins_orders_path
    elsif params[:order][:status] == "発送済み"
      @order.update(status: 4)
    redirect_to admins_orders_path
    else
      render "edit"
    end
    flash[:notice] = "You have updated customer successfully."
  end
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_price, :payment_method, :status)
  end
end