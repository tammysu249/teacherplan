class Api::V1::TeachersController < Api::V1::GraphitiController
  def index
    teachers = TeacherResource.all(params)
    respond_with(teachers)
  end

  def show
    teacher = TeacherResource.find(params)
    respond_with(teacher)
  end

  def create
    teacher = TeacherResource.build(params)

    if teacher.save
      render jsonapi: teacher, status: 201
    else
      render jsonapi_errors: teacher
    end
  end

  def update
    teacher = TeacherResource.find(params)

    if teacher.update_attributes
      render jsonapi: teacher
    else
      render jsonapi_errors: teacher
    end
  end

  def destroy
    teacher = TeacherResource.find(params)

    if teacher.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: teacher
    end
  end
end
