class Person::Master < ActiveRecord::Base
	has_one :candidate, :class_name => "Person::Candidate"
	has_one :instructor, :class_name => "Person::Instructor"

	validates :family_name, length: { minimum: 1, maximum: 35 }
	validates :given_name, length: { minimum: 1, maximum: 35 }
	validates :other_names, length: { maximum: 35 }
	validates :sex, :dob, presence: true

	def display_name
		return "#{self.given_name} #{self.family_name}"
	end

	def full_name
		return "#{self.family_name}, #{self.given_name} #{self.other_names}"
	end
end
