class ItemsController < ApplicationController
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

  private

  def item_params
    params.require(:item).permit(:title).merge(plan_id: params[:plan_id])
  end
end
