class Course::Master < ActiveRecord::Base
	has_many :course_events, class_name: "Course::Event"

	validates :code, :title, :duration, :min_candidate, :max_candidate, presence: true
	validates :code, length: { minimum: 1, maximum: 8 }
	validates :title, length: { minimum: 1, maximum: 80 }
	validates :min_candidate, :max_candidate, numericality: { only_integer: true }
	validates_each :duration do |rec, attr, val|
		rec.errors.add(attr, "must be a whole number or end in half") if val % 0.5 > 0
	end

	def duration_human
		@number = self.duration < 1 ? "" : self.duration.floor.to_s
		@number += self.duration % 1 > 0 ? "&frac12;" : ""
		@number += " " + "day".pluralize(self.duration)
		return @number.html_safe
	end

end