class Course::EventsController < ApplicationController
  before_action :set_course_event, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:index, :new]

  # GET /course/events
  # GET /course/events.json
  def index
    @course_events = @course.course_events
  end

  # GET /course/events/1
  # GET /course/events/1.json
  def show
  end

  # GET /course/events/new
  def new
    add_breadcrumb "New Event", new_course_event_path(@course.code.downcase)
    @course_event = @course.course_events.build
  end

  # GET /course/events/1/edit
  def edit
  end

  # POST /course/events
  # POST /course/events.json
  def create
    @course_event = Course::Event.new(course_event_params)

    respond_to do |format|
      if @course_event.save
        format.html { redirect_to course_event_index_path(@course_event.master.code), notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @course_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course/events/1
  # PATCH/PUT /course/events/1.json
  def update
    respond_to do |format|
      if @course_event.update(course_event_params)
        format.html { redirect_to @course_event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course/events/1
  # DELETE /course/events/1.json
  def destroy
    @course_event.destroy
    respond_to do |format|
      format.html { redirect_to course_events_url }
      format.json { head :no_content }
    end
  end

  private
    def set_course
      @course = Course::Master.find_by :code => params[:course_id].upcase
      add_breadcrumb "<span class=\"glyphicon glyphicon-home\"></span>".html_safe, :root_path
      add_breadcrumb "Course", :course_index_path
      add_breadcrumb @course.code, course_path(@course.code.downcase)
      add_breadcrumb "Events", course_event_index_path(@course.code.downcase)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_course_event
      @course_event = Course::Event.find(params[:id])
      add_breadcrumb "<span class=\"glyphicon glyphicon-home\"></span>".html_safe, :root_path
      add_breadcrumb "Course", :course_index_path    
      add_breadcrumb @course_event.master.code, course_path(@course_event.master.code.downcase)
      add_breadcrumb "Events", course_event_index_path(@course_event.master.code.downcase)
      add_breadcrumb @course_event.start_date.strftime('%A %d %B %Y'), event_path(@course_event.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_event_params
      params.require(:course_event).permit(:master_id, :start_date, :end_date)
    end
end
