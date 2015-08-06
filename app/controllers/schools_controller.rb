class SchoolsController < ApplicationController
  before_action :authenticate

  def index
    @schools = School.all
    render json: @schools, status: 200
  end

  def create
    p '----', params,'====='
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
    p '1@@@@@@@'
    if school
      p '2@@@@@@@'
      p school
      if school.archived
        render json: [feedback: 'School has ben archived.']
      else
        p '3@@@@@@@'
        school.archived = true
        if school.save
          render json: [feedback: 'Archived']
        else
          render json: [error: 'Error on archive school.']
        end
      end
    else
      p '7@@@@@@@'
      render json: [error: 'School not found.']
    end
 end

  protected
    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Basic realm="Episodes"'
      #p self
    end

    def authenticate
      authenticate_basic_auth || render_unauthorized
    end

    def authenticate_basic_auth
      authenticate_or_request_with_http_basic('Schools') do |username, password|
        @user = User.find_by_email(username)
        p username, '$$$$$$$',password
        @user.authenticate(password)
      end
    end

  private
    def school_params
      params.require(:school).permit(:first_name, :description, :email, :password_digest)
    end
end