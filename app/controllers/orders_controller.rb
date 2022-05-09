class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to order_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code,:item_prefecture_id, :city, :addresses, :building, :phone_number, :order).merge(user_id: current_user.id)
  end

end
