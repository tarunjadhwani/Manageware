class PaymentSchedule < ActiveRecord::Base
	belongs_to :customer
	validates :customer_id, presence: true 
	validates :amount, presence: true 
	validates :payment_date, presence: true 
end
