class DetailsController < ApplicationController
  def new
    @detail = Detail.new
  end

  def create
    @detail = Detail.new(detail_params)
    if @detail.save
      redirect_to plan_path(params[:plan_id])
    else
      render :new
    end
  end

  def show
    @detail = Detail.find(params[:id])
  end

  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy
    redirect_to plan_path(@detail.item.plan.id)
  end

  private

  def detail_params
    params.require(:detail).permit(:title, :text).merge(item_id: params[:item_id])
  end
end
