class Person::Instructor < ActiveRecord::Base
	belongs_to :master, :class_name => "Person::Master"
	has_many :course_events, :class_name => "Course::Event"

	def cid
		return "T#{self.id}"
	end

	def id_and_name
		return "T#{self.id} #{self.master.given_name} #{self.master.family_name}"
	end
end
