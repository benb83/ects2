class Course::Event < ActiveRecord::Base
	belongs_to :master, class_name: "Course::Master"
	has_many :candidates, class_name: "Course::EventCandidate"
end
