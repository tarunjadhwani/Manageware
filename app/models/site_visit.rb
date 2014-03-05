class SiteVisit < ActiveRecord::Base
	belongs_to :customer
	validates :customer_id, presence: true 
	validates :work_completed, presence: true
	validates :visit_date, presence: true
end
