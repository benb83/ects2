class Person::Candidate < ActiveRecord::Base
	belongs_to :master, :class_name => "Person::Master"
	has_many :event_candidates, :class_name => "Course::EventCandidate"

	def cid
		return "C#{self.id}"
	end
end
