class User < ActiveRecord::Base
	belongs_to :person, class_name: "Person::Master"
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :recoverable, :registerable
end
