class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    render :'show.html'
  end

  def activate
    set_student
    @student.active ? @student.update(active: false) : @student.update(active: true)
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
