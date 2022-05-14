class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :order_create, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    if @item.user_id == current_user.id 
      redirect_to root_path
    end
  end
  
  
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to items_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:postal_code,:item_prefecture_id, :city, :addresses, :building, :phone_number, :order).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency: 'jpy' 
    )
  end

  def order_create
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
  end
  
end
