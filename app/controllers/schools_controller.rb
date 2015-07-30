class SchoolsController < ApplicationController

  def index
    @schools = School.all
    render json: @schools, status: 200
  end

  def create
    school = School.new(school_params)
    if school.save
      render json: school, status: 201, location: school
    end
  end

  def update
    school = School.find(params[:id])
    if school.update(school_params)
      render json: school, status: 200
    else
      render json: school.errors, status: 422
    end
 end

  def show
    school = School.find_by_id params[:id]
    p school, '----', params
    if school
      render json: school, status: 200
    else
      render json: [error: 'Teste'], status: 404
    end
  end

  def destroy
    school = School.find_by_id params[:id]
    if school
      p school, '**************'
      school = School.find_unarchived(params[:id])
      if school.archive
        render json: [feedback: 'Archived'], status: 204
      else
        render json: [error: 'Error on archive school.'], status: 204
      end
    else
      render json: [error: 'School not found.'], status: 200
    end
 end

  private
    def school_params
      params.require(:school).permit(:first_name, :description, :email, :password_digest)
    end
end