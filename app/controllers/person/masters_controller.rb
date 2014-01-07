class Person::MastersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "<span class=\"glyphicon glyphicon-home\"></span>".html_safe, :root_path
  add_breadcrumb "People", :people_path

  def index
  	@people = Person::Master.paginate(:page => params[:page])
  end

  def show
  	add_breadcrumb @person.full_name, person_path(@person.id)
  end

  def new
		add_breadcrumb "New Course", :new_person_path
    @person = Person::Master.new
  end

 	def create
    @person = Person::Master.new(person_params)
    if @person.save
      @@child = false
      if params[:person_master_options] == 'candidate'
        @candidate = Person::Candidate.new(:master => @person)
        @@child = @candidate.save
      elsif params[:person_master_options] == 'instructor'
        @instructor = Person::Instructor.new(:master => @person)
        @@child = @instructor.save
      else
        @@child = true
      end

      if @@child
        respond_to do |format|
          format.html { redirect_to person_path(@person.id), notice: 'Person was successfully created.' }
          format.json { render action: 'show', status: :created, location: @person }
        end
      else
        respond_to do |format|
          format.html { redirect_to person_path(@person.id), notice: 'Person was created. Unable to generate child record.' }
          format.json { render action: 'show', status: :created, location: @person }
        end
      end

    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }        
      end      
    end

  end

  def edit
  	add_breadcrumb @person.full_name, person_path(@person.id)
  	add_breadcrumb 'Edit', edit_person_path(@person.id)
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_path(@person.id), notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_person
      @person = Person::Master.find(params[:id])
    end
    def person_params
      params.require(:person_master).permit(:family_name, :given_name, :other_names, :sex, :dob)
    end
end
