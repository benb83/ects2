class Course::Event < ActiveRecord::Base
	belongs_to :master, class_name: "Course::Master"
	belongs_to :instructor, class_name: "Person::Instructor"
	has_many :candidates, class_name: "Course::EventCandidate"

	def row_class
		if self.candidates.nil?
			return "count-under"
		elsif self.candidates.count < self.master.min_candidate
			return "count-under"
		elsif self.candidates.count > self.master.max_candidate
			return "count-over"
		else
			return "count-okay"
		end
	end
end
