class StudentsController < ApplicationController
  def index
    @students = policy_scope(Student)
  end

  def show
    @student = Student.find(params[:id])
    authorize @student
  end
end
