class StudentGoalsController < ApplicationController
  before_action :authenticate_user!, :set_student
  def new
    @student_goal = StudentGoal.new
    authorize @student_goal
  end

  def create
    @student_goal = @student.student_goals.new(student_goal_params)
    authorize @student_goal

    if @student_goal.save
      redirect_to @student, notice: "Goal assigned"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @student_goal = @student.student_goals.find(params[:id])
    @progress_entry = @student_goal.progress_entries.new
    @progress_entries = @student_goal.progress_entries.order(recorded_on: :desc)
  end

  def destroy
    @student_goal = @student.student_goals.find(params[:id])
    @student_goal.destroy
    redirect_to student_student_goals_path(@student), notice: "StudentGoal was succesfully deleted"
  end

private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def student_goal_params
    params.require(:student_goal).permit(
      :goal_id,
      :start_on,
      :target_date,
      :baseline,
      :target_value,
      :status,
      :mastery_percent,
      progress_entries_attributes: %i[id recorded_on note evidence_url evidence_url score_numeric]
    )
  end
end
