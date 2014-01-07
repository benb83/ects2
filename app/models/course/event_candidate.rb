class Course::EventCandidate < ActiveRecord::Base
	belongs_to :event, class_name: "Course::Event"
	belongs_to :candidate, class_name: "Person::Candidate"

	validates :candidate, :uniqueness => { :scope => :event }
end
