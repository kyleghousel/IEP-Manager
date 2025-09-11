class ProgressEntriesController < ApplicationController
  before_action :authenticate_user!, :set_student_and_student_goal

  def create
    @progress_entry = @student_goal.progress_entries.new(progress_entries_params)
    @progress_entry.user = current_user

    authorize @progress_entry

    if @progress_entry.save
      redirect_to student_student_goal_path(@student, @student_goal), notice: "Entry added"
    else
      @progress_entries = @student_goal.progress_entries.order(recorded_on: :desc)
      render "student_goals/show", status: :unprocessable_entity
    end
  end

  def destroy
    @progress_entry = @student_goal.progress_entries.find(params[:id])
    authorize @progress_entry
    @progress_entry.destroy
    redirect_to student_student_goal_path(@student, @student_goal), notice: "Progress Entry deleted"
  end

private

  def set_student_and_student_goal
    @student = Student.find(params[:student_id])
    @student_goal = StudentGoal.find(params[:student_goal_id])
  end

  def progress_entries_params
    params.require(:progress_entry).permit(
      :recorded_on,
      :note,
      :evidence_url,
      :score_numeric
    )
  end
end
