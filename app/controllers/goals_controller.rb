class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: %i[show edit update destroy]

  def show
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
    authorize @goal
  end

  def update
    authorize @goal

    if @goal.update(goal_params)
      redirect_to @goal, notice: "Updated"
    else
      render :edit
    end
  end

  def destroy
    authorize @goal
    @goal.destroy
    redirect_to students_path, notice: "Deleted"
  end

private

  def goal_params
    params.require(:goal).permit(:name, :objectives, :category, :active)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
