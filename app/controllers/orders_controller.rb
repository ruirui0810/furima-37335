class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set, only:[:index, :create]
  before_action :order_create, only: :index

  def index
    @order_address = OrderAddress.new
    if @item.user_id == current_user.id 
      redirect_to root_path
    end
  end
  

  def create
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
    params.require(:order_address).permit(:postal_code,:item_prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
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
    if @item.order.present?
      redirect_to root_path
    end
  end
  
  def item_set
    @item = Item.find(params[:item_id])
  end
end
