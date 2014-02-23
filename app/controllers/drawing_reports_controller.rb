class DrawingReportsController < ApplicationController
	before_filter :get_customer

	def new
		@drawing_report = DrawingReport.new
	end

	def create
		@drawing_report = @customer.drawing_reports.build(drawing_report_params)
		if @drawing_report.save
			flash[:success] = "Drawing Report created successfully"
			redirect_to customer_drawing_reports_path
		else
			render 'new'
		end
	end

	def edit
	end

	def index
		@drawing_reports = @customer.drawing_reports.all
	end

	def update
		@drawing_report = @customer.drawing_report.find(params[:id])
		if @customer.drawing_report.update_attributes(drawing_report_params)
			redirect_to customer_drawing_reports_path
			flash[:success] = "Drawing Report updated"
		else
			render 'edit'
		end
	end

private
	
	def get_customer
		@customer = Customer.find(params[:customer_id])
	end

	def drawing_report_params
		params.require(:drawing_report).permit(:revision_no, :list_of_drawing, :copy, :date_completed, :customer_id)	
	end
end