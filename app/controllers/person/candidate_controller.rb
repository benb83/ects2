class Person::CandidateController < ApplicationController
  def search
  	@pram = candidate_params
  	@candidates = []
  	if @pram[:candidate_id].empty?
  		@candidates = Person::Candidate.joins(:master).where( "person_masters.family_name LIKE ? AND person_masters.given_name LIKE ? AND person_masters.other_names LIKE ?", "%#{@pram[:family_name]}%", "%#{@pram[:given_name]}%", "%#{@pram[:other_names]}%" ).select("person_candidates.id, person_masters.family_name, person_masters.given_name, person_masters.other_names")
  	else
  		@candidates = Person::Candidate.joins(:master).where( :person_candidates => { :id => @pram[:candidate_id] }).select("person_candidates.id, person_masters.family_name, person_masters.given_name, person_masters.other_names")
  	end
  	respond_to do |format|
  		format.html { render html: @pram }
  		format.json { render json: @candidates }
  	end
  end

  private
    def candidate_params
      params.require(:candidate).permit(:candidate_id, :family_name, :given_name, :other_names)
    end

end
