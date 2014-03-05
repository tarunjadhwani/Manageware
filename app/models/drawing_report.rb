class DrawingReport < ActiveRecord::Base
	belongs_to :customer
	validates :customer_id, presence: true 
	validates :list_of_drawing, presence: true
	validates :date_completed, presence: true
end
