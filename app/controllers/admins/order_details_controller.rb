class Admins::OrderDetailsController < Admins::Base
    def edit
    @order_detail = Order_detail.find(params[:id])
  end

  def update
    @order_detail = Order_detail.find(params[:id])
    if @order_detail.update(order_params)
    redirect_to admins_order_path(@order_detail.id)
    flash[:notice] = "You have updated customer successfully."
    else
      render "edit"
    end
  end
end
