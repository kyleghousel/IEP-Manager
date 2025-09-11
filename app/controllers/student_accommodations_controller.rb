class StudentAccommodationsController < ApplicationController
  before_action :authenticate_user!, :set_student
  def new
    @student_accommodation = StudentAccommodation.new
    authorize @student_accommodation
  end

  def create
    @student_accommodation = @student.student_accommodations.new(student_accommodation_params)
    authorize @student_accommodation

    if @student_accommodation.save
      redirect_to @student, notice: "Accommodation assigned"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @student_accommodation = @student.student_accommodations.find(params[:id])
  end

  def destroy
    @student_accommodation = @student.student_accommodations.find(params[:id])
    authorize @student_accommodation
    @student_accommodation.destroy
    redirect_to student_path(@student), notice: "StudentAccommodation was succesfully deleted"
  end

private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def student_accommodation_params
    params.require(:student_accommodation).permit(
      :student_id,
      :accommodation_id,
      :start_on,
      :end_on,
      :notes
    )
  end
end
