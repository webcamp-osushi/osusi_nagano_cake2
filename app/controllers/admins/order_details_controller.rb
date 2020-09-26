class Admins::OrderDetailsController < Admins::Base
    def edit
    @order_detail = Order_detail.find(params[:id])
    end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if params[:order_detail][:making_status] == "製作中"
      @order_detail.update(making_status: 2)
      @order.update(status: 2)
    redirect_to admins_orders_path
# 注文個数を数えてそれが注文総数と一緒の場合のみ以下の処理を行う
    elsif params[:order_detail][:making_status] == "製作完了"
      @order_detail.update(making_status: 3)
      if @order.order_details.where(making_status: 3).count == @order.order_details.count
        @order.update(status: 3)
      end
     redirect_to admins_orders_path
    else
      render "admins/orders/edit"
    end
     
      flash[:notice] = "You have updated customer successfully."
  end
end
