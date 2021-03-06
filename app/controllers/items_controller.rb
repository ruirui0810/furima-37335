class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :item_purchase ,only: :edit


  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    end
  end
  
private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_price, :item_category_id, :item_sales_status_id, :item_shipping_free_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def  item_purchase
    if @item.order.present?
      redirect_to root_path
    end
  end
  
end