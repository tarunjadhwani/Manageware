class PaymentSchedulesController < ApplicationController
	before_filter :get_customer, :except => [:edit, :update]

	def new
		@payment_schedule = PaymentSchedule.new
	end

	def create
		@payment_schedule = @customer.payment_schedules.build(payment_schedule_params)
		if @payment_schedule.save
			flash[:success] = "Payment Schedule created successfully"
			redirect_to customer_payment_schedules_path
		else
			render 'new'
		end
	end

	def index
		@payment_schedules = @customer.payment_schedules.all
	end

	def edit
		@payment_schedule = PaymentSchedule.find(params[:id])
	end

	def update
		@payment_schedule = PaymentSchedule.find(params[:id])
		if @payment_schedule.update_attributes(payment_schedule_params)
			redirect_to customer_payment_schedules_path(@payment_schedule.customer_id)
			flash[:success] = "Payment Schedule updated"
		else
			render 'edit'
		end
	end

private
	
	def get_customer
		@customer = Customer.find(params[:customer_id])
	end

	def payment_schedule_params
		params.require(:payment_schedule).permit(:status, :amount, :payment_date, :customer_id)	
	end
end
