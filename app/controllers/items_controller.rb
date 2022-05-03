class ItemsController < ApplicationController

  def index
  end

  def new
  end
end

private

def item_params
  params.require(:item).permit(:item_name, :item_info, :image).merge(user_id: current_user.id)
end