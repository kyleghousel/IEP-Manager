class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = policy_scope(Student)
  end

  def show
    @student = Student.find(params[:id])
    authorize @student
  end

  def new
    @student = Student.new
    authorize @student
  end

  def create
    @student = Student.new(student_params)
    authorize @student

    if @student.save
      redirect_to @student, notice: "Created"
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
    authorize @student
  end

  def update
    @student = Student.find(params[:id])
    authorize @student

    if @student.update(student_params)
      redirect_to @student, notice: "Updated"
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :dob, :diagnosis, :grade_level)
  end
end
