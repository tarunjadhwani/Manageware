class WorkSchedule < ActiveRecord::Base
	validates :task_work, presence: true
	validates :duration, presence: true
	validates :start_date, presence: true
	validates :finish_date, presence: true
end
