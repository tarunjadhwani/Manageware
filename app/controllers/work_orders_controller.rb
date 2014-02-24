class WorkOrdersController < ApplicationController
	before_filter :get_customer

	def new
		@work_order = WorkOrder.new
	end

	def create
		@work_order = @customer.build_work_order(work_order_params)
		if @work_order.save
			flash[:success] = "Work Order created successfully"
			redirect_to show_customer_path
		else
			render 'new'
		end
	end

	def edit
		@work_order = @customer.work_order(params[:id])
	end

	def update
		if  @customer.work_order.update_attributes(work_order_params)
			redirect_to customer_path
			flash[:success] = "Work Order updated"
		else
			render 'edit'
		end
	end


private
	
	def get_customer
		@customer = Customer.find(params[:id])
	end

	def work_order_params
		params.require(:work_order).permit(:area, :payment_type, :amount, :customer_id)	
	end
end
