class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_parents, only: %i[new create edit update]

  def index
    @students = policy_scope(Student)
    @goals = policy_scope(Goal)
    @accommodations = policy_scope(Accommodation)
  end

  def show
    @student = Student.find(params[:id])
    @students = policy_scope(Student)
    authorize @student
  end

  def new
    @student = Student.new
    @users = User.parents_only
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
    @users = User.parents_only
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

  def destroy
    @student = Student.find(params[:id])
    authorize @student
    @student.destroy
    redirect_to students_path, notice: "Removed student"
  end

private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :dob, :diagnosis, :grade_level, :parent_id)
  end

  def load_parents
    @users = User.where(role: "parent").order(:last_name, :first_name)
  end
end
