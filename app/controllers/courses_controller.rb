class CoursesController < Application
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new
    if @course.save(course_params)
      redirect_to course_path, notice: "Yeah the course was created."
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: "Updated like a fresh coat of paint."
    else
      render :new
    end
  end

  def show

  end

  def destroy

  end

private

def set_course
  @course = Course.find(params[:id])
end

def course_params
  params.require(:course).permit(:title, :tod)
end

end
