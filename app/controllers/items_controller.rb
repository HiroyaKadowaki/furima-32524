class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!,only: [:new, :edit, :uptate, :destroy]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :burden_id, :category_id, :province_id, :ship_day_id, :state_id).merge(user_id: current_user.id)
  end

end
