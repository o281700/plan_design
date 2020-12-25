class PlansController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :edit]
  before_action :set_plan, only: [:edit, :update, :show, :destroy]

  def index
    @plans = Plan.includes(:user)
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @plan.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def plan_params
    params.require(:plan).permit(:title).merge(user_id: current_user.id)
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end
end
