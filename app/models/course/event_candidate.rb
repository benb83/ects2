class Course::EventCandidate < ActiveRecord::Base
	belongs_to :event, class_name: "Course::Event"
end
