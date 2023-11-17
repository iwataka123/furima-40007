class BuyingHistoriesController < ApplicationController
  before_action :move_to_index
  before_action :set_item

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buying_history_payment = BuyingHistoryPayment.new
    if @item.user_id == current_user.id || @item.buying_history != nil
      redirect_to root_path
    end
  end

  def create
    @buying_history_payment = BuyingHistoryPayment.new(buying_history_params)
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if @buying_history_payment.valid?
      @buying_history_payment.save
      pay_item
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def buying_history_params
    params.require(:buying_history_payment).permit(:post_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buying_history_params[:token],
      currency: 'jpy'
    )
  end
end
