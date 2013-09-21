class Todo < ActiveRecord::Base
	belongs_to :user
	attr_accessor :title, :description, :to_date, :to_time
	validates_presence_of :title
	validates_presence_of :description
	validates_presence_of :to_date
	validates_presence_of :to_time

end
