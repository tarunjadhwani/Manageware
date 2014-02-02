class Customer < ActiveRecord::Base
	validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}
	validates :company, length: {maximum: 70}
end
