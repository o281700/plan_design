class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to plan_path(item.plan)
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to plan_path(@item.plan.id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to plan_path(@item.plan.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title).merge(plan_id: params[:plan_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
