class WorkSchedulesController < ApplicationController
	before_filter :get_customer, :except => [:edit, :update]
	layout "otherlayout", only: :report

	def new
		@work_schedule = WorkSchedule.new
	end

	def create
		@work_schedule = @customer.work_schedules.build(work_schedule_params)
		if @work_schedule.save
			flash[:success] = "Payment Schedule created successfully"
			redirect_to customer_work_schedules_path
		else
			render 'new'
		end
	end

	def edit
		@work_schedule = WorkSchedule.find(params[:id])
	end

	def update
		@work_schedule = WorkSchedule.find(params[:id])
		if @work_schedule.update_attributes(work_schedule_params)
			redirect_to customer_work_schedules_path(@work_schedule.customer_id)
			flash[:success] = "Payment Schedule updated"
		else
			render 'edit'
		end
	end

	def index
		@work_schedules = @customer.work_schedules.all
	end

	def report
		@work_schedules = @customer.work_schedules.all
		respond_to do |format|
	        format.html
	        format.pdf do
	          render :pdf => "Work Schedule Report",
	          :template => "/work_schedules/report.html.erb",
	          :disposition => "attachment",
	          :filename => "WorkSchedule Report"
	        #  :save_to_file => Rails.root.join('pdfs', "#{@formdetail.id}.pdf")
	        end
	    end
	end

private
	
	def get_customer
		@customer = Customer.find(params[:customer_id])
	end

	def work_schedule_params
		params.require(:work_schedule).permit(:task_work, :duration, :start_date, :finish_date, :customer_id)	
	end
end
