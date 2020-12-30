class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  before_action :set_order, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :move_to_user, only: [:index, :create]

  def index
    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(ship_params)
    if @order_ship.valid?
      pay_order
      @order_ship.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def move_to_index
    if @order.order != nil
      redirect_to root_path action: :index
    end
  end

  def move_to_user
    if @order.user_id == current_user.id
      redirect_to root_path action: :index
    end
  end

  def ship_params
    params.require(:order_ship).permit(:zip, :city, :address, :buiding, :phone_number, :province_id).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_order
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @order.price,
      card: ship_params[:token],
      currency:'jpy'
    )
  end

  def set_order
    @order = Item.find(params[:item_id])
  end
end
