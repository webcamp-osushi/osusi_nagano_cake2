class Admins::OrdersController < Admins::Base
  def index
  end
  def edit
    @order = Order.find(params[:id])
  end
end
