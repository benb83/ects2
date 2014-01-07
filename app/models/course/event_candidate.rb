class Course::EventCandidate < ActiveRecord::Base
	belongs_to :event, class_name: "Course::Event"
	belongs_to :candidate, class_name: "Person::Candidate"
	belongs_to :cost_currency, class_name: "Financial::Currency"

	validates :candidate, :uniqueness => { :scope => :event }
end
