class Course::Event < ActiveRecord::Base
	belongs_to :master, class_name: "Course::Master"
	belongs_to :instructor, class_name: "Person::Instructor"
	has_many :candidates, class_name: "Course::EventCandidate"
end
