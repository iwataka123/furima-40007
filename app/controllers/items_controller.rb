class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :user_check, only: [:edit, :destroy]

  def index
    @items = Item.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if @item.buying_history != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_check
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
