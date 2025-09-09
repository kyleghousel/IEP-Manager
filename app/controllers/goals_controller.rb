class GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goals = policy_scope(Goal)
  end

  def show
    @goal = Goal.find(params[:id])
    @goals = policy_scope(Goal)
    authorize @goal
  end

  def new
    @goal = Goal.new
    authorize @goal
  end

  def create
    @goal = Goal.new(goal_params)
    authorize @goal

    if @goal.save
      redirect_to @goal, notice: "Created"
    else
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    authorize @goal
  end

  def update
    @goal = Goal.find(params[:id])
    authorize @goal

    if @goal.update(goal_params)
      redirect_to @goal, notice: "Updated"
    else
      render :edit
    end
  end

private

  def goal_params
    params.require(:goal).permit(:name, :objectives, :category, :active)
  end
end
