class Course::EventCandidatesController < ApplicationController
  before_action :set_course_event_candidate, only: [:show, :edit, :update, :destroy]
  before_action :set_course_event, only: [:index]

  # GET /course/event_candidates
  # GET /course/event_candidates.json
  def index
    @course_event_candidates = @course_event.candidates.all
  end

  # GET /course/event_candidates/1
  # GET /course/event_candidates/1.json
  def show
  end

  # GET /course/event_candidates/new
  def new
    @course_event_candidate = Course::EventCandidate.new
  end

  # GET /course/event_candidates/1/edit
  def edit
  end

  # POST /course/event_candidates
  # POST /course/event_candidates.json
  def create
    @course_event_candidate = Course::EventCandidate.new(course_event_candidate_params)

    respond_to do |format|
      if @course_event_candidate.save
        format.html { redirect_to @course_event_candidate, notice: 'Event candidate was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_event_candidate }
      else
        format.html { render action: 'new' }
        format.json { render json: @course_event_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course/event_candidates/1
  # PATCH/PUT /course/event_candidates/1.json
  def update
    respond_to do |format|
      if @course_event_candidate.update(course_event_candidate_params)
        format.html { redirect_to @course_event_candidate, notice: 'Event candidate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course_event_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course/event_candidates/1
  # DELETE /course/event_candidates/1.json
  def destroy
    @course_event_candidate.destroy
    respond_to do |format|
      format.html { redirect_to course_event_candidates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_event
      @course_event = Course::Event.find(params[:event_id])
      add_breadcrumb "<span class=\"glyphicon glyphicon-home\"></span>".html_safe, :root_path
      add_breadcrumb "Course", :course_index_path    
      add_breadcrumb @course_event.master.code, course_path(@course_event.master.code.downcase)
      add_breadcrumb "Events", course_event_index_path(@course_event.master.code.downcase)
      add_breadcrumb @course_event.start_date.strftime('%A %d %B %Y'), event_path(@course_event.id)
      add_breadcrumb "Candidates", event_candidate_index_path(@course_event.id)
    end

    def set_course_event_candidate
      @course_event_candidate = Course::EventCandidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_event_candidate_params
      params.require(:course_event_candidate).permit(:course_event_id, :person_candidate_id)
    end
end
