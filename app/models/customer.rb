class Customer < ActiveRecord::Base
	has_one :work_order, dependent: :destroy
	has_many :drawing_reports, dependent: :destroy
	has_many :payment_schedules, dependent: :destroy
	has_many :site_visits, dependent: :destroy
	has_many :work_schedules, dependent: :destroy
	validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}
	validates :company, length: {maximum: 70}

end
