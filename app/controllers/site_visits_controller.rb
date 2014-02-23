class SiteVisitsController < ApplicationController
	before_filter :get_customer

	def new
		@site_visit = SiteVisit.new
	end

	def create
		@site_visit = @customer.site_visit.build(site_visit_params)
		if @site_visit.save
			flash[:success] = "Payment Schedule created successfully"
			redirect_to customer_site_visits_path
		else
			render 'new'
		end
	end

	def edit
	end

	def index
		@site_visits = @customer.site_visits.all
	end

	def update
		@site_visit = @customer.site_visit.find(params[:id])
		if @customer.site_visit.update_attributes(site_visit_params)
			redirect_to customer_site_visits_path
			flash[:success] = "Payment Schedule updated"
		else
			render 'edit'
		end
	end

private
	
	def get_customer
		@customer = Customer.find(params[:customer_id])
	end

	def site_visit_params
		params.require(:site_visit).permit(:work_completed, :visit_date, :customer_id)	
	end
end
