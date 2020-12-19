class PlansController < ApplicationController
  def index
    @plans = Plan.includes(:user)
  end

  def new
    @plan = Plan.new
  end

  def create
    plan = Plan.new(plan_params)
    if plan.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to root_path
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    if plan.update(plan_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:title).merge(user_id: current_user.id)
  end
end
