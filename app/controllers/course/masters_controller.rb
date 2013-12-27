class Course::MastersController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "<span class=\"glyphicon glyphicon-home\"></span>".html_safe, :root_path
  add_breadcrumb "Courses", :course_index_path

  # GET /course/masters
  # GET /course/masters.json
  def index
    @courses = Course::Master.all
  end

  # GET /course/masters/1
  # GET /course/masters/1.json
  def show
    add_breadcrumb @course.code, course_path(@course.code.downcase)
  end

  # GET /course/masters/new
  def new
    add_breadcrumb "New Course", :new_course_path
    @course = Course::Master.new
  end

  # GET /course/masters/1/edit
  def edit
    add_breadcrumb @course.code, course_path(@course.code.downcase)
    add_breadcrumb "Edit", edit_course_path(@course.code.downcase)
  end

  # POST /course/masters
  # POST /course/masters.json
  def create
    @course = Course::Master.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_path(@course), notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course/masters/1
  # PATCH/PUT /course/masters/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_path(@course.code.downcase), notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course/masters/1
  # DELETE /course/masters/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to course_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course::Master.find_by(code: params[:id].upcase)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course_master).permit(:code, :title, :duration, :min_candidate, :max_candidate, :instructor_id)
    end
end
