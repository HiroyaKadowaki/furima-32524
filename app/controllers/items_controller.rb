class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!,only: [:new, :create]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
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
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    # @item = Item.find(params[:id])
    # @item.destroy
    # if @item.delete
    #   redirect_to root_path
    # end
  end

 private
 def move_to_index
  unless user_signed_in?
    redirect_to new_user_session_path action: :index
  end
end

  def item_params
    params.require(:item).permit(:name, :description, :price, :burden_id, :category_id, :province_id, :ship_day_id, :state_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
