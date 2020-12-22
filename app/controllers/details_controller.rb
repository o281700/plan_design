class DetailsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :show]
  before_action :set_detail, only: [:show, :destroy, :edit, :update]

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
  end

  def destroy
    @detail.destroy
    redirect_to plan_path(@detail.item.plan.id)
  end

  def edit
  end

  def update
    if @detail.update(detail_params)
      redirect_to plan_item_detail_path(@detail.item.plan.id, @detail.item.id, @detail.id)
    else
      render :edit
    end
  end

  private

  def detail_params
    params.require(:detail).permit(:title, :text).merge(item_id: params[:item_id])
  end

  def set_detail
    @detail = Detail.find(params[:id])
  end
end
